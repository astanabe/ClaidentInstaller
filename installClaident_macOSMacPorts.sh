sudo -E port -N install pkgconfig gmake gcc10 libgcc10 coreutils grep wget unzip gnutar xz zlib gzip bzip2 pigz lbzip2 autoconf automake OpenBLAS pcre2 readline jpeg libpng cairo pango gettext tiff libxml2 tcl tk ImageMagick git curl || exit $?
if test -z $PREFIX; then
PREFIX=/usr/local || exit $?
fi
NCPU=`sysctl -n hw.logicalcpu_max`
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"
export CC=`ls -d /opt/local/bin/gcc-mp-* | ggrep -P '\/gcc-mp-\d+$' | sort | tail -n 1`
export CXX=`ls -d /opt/local/bin/g++-mp-* | ggrep -P '\/g\+\+-mp-\d+$' | sort | tail -n 1`
export FC=`ls -d /opt/local/bin/gfortran-mp-* | ggrep -P '\/gfortran-mp-\d+$' | sort | tail -n 1`
# download, compile, and install Perl modules
if ! test -e .perlmodules; then
sudo -HE sh -c "yes '' | cpan -fi File::Copy::Recursive DBI DBD::SQLite Math::BaseCnv Math::CDF" || exit $?
touch .perlmodules || exit $?
fi
# download, and install Claident
if ! test -e .claident; then
wget -nv -c https://github.com/astanabe/Claident/archive/v0.9.2024.02.21.tar.gz -O Claident-0.9.2024.02.21.tar.gz || exit $?
gnutar -xzf Claident-0.9.2024.02.21.tar.gz || exit $?
cd Claident-0.9.2024.02.21 || exit $?
gmake PREFIX=$PREFIX -j$NCPU || exit $?
gmake PREFIX=$PREFIX install 2> /dev/null || sudo gmake PREFIX=$PREFIX install || exit $?
cp $PREFIX/share/claident/.claident ~/.claident || exit $?
cd .. || exit $?
rm -rf Claident-0.9.2024.02.21 || exit $?
rm -f Claident-0.9.2024.02.21.tar.gz || exit $?
touch .claident || exit $?
fi
# download, compile, and install Swarm
if ! test -e .swarm; then
wget -nv -c https://github.com/torognes/swarm/archive/v3.1.4.tar.gz -O swarm-3.1.4.tar.gz || exit $?
gnutar -xzf swarm-3.1.4.tar.gz || exit $?
cd swarm-3.1.4/src || exit $?
perl -i -npe 's/-mtune=generic/-O3 -mtune=native -fomit-frame-pointer -finline-functions/' src/Makefile || exit $?
gmake -j$NCPU || exit $?
mkdir -p $PREFIX/share/claident/bin 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv -f swarm $PREFIX/share/claident/bin/ 2> /dev/null || sudo mv -f swarm $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf swarm-3.1.4 || exit $?
rm -f swarm-3.1.4.tar.gz || exit $?
touch .swarm || exit $?
fi
# download, compile, and install VSEARCH
if ! test -e .vsearch; then
wget -nv -c https://github.com/torognes/vsearch/archive/v2.26.1.tar.gz -O vsearch-2.26.1.tar.gz || exit $?
gnutar -xzf vsearch-2.26.1.tar.gz || exit $?
cd vsearch-2.26.1 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident --disable-pdfman || exit $?
gmake -j$NCPU || exit $?
if test -e $PREFIX/share/claident/bin/vsearch; then
rm -f $PREFIX/share/claident/bin/vsearch 2> /dev/null || sudo rm -f $PREFIX/share/claident/bin/vsearch || exit $?
fi
gmake install-exec 2> /dev/null || sudo gmake install-exec || exit $?
if ! test -e $PREFIX/bin/vsearch; then
ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch 2> /dev/null || sudo ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch || exit $?
fi
cd .. || exit $?
rm -rf vsearch-2.26.1 || exit $?
rm -f vsearch-2.26.1.tar.gz || exit $?
touch .vsearch || exit $?
fi
# download, compile, and install VSEARCH5D
if ! test -e .vsearch5d; then
wget -nv -c https://github.com/astanabe/vsearch5d/archive/v2.26.1.tar.gz -O vsearch5d-2.26.1.tar.gz || exit $?
gnutar -xzf vsearch5d-2.26.1.tar.gz || exit $?
cd vsearch5d-2.26.1 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident || exit $?
gmake -j$NCPU || exit $?
gmake install-exec 2> /dev/null || sudo gmake install-exec || exit $?
cd .. || exit $?
rm -rf vsearch5d-2.26.1 || exit $?
rm -f vsearch5d-2.26.1.tar.gz || exit $?
touch .vsearch5d || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -nv -c https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.15.0/ncbi-blast-2.15.0+-src.tar.gz || exit $?
gnutar -xzf ncbi-blast-2.15.0+-src.tar.gz || exit $?
cd ncbi-blast-2.15.0+-src/c++ || exit $?
BREWPATH=`brew --prefix`
./configure --prefix=$PREFIX/share/claident --with-bin-release --with-dll --with-mt --with-openmp --with-64 --with-lfs --without-debug --without-boost --without-gbench --without-gui --without-ctools || exit $?
gmake -j$NCPU || exit $?
gmake install 2> /dev/null || sudo gmake install || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.15.0+-src || exit $?
rm -f ncbi-blast-2.15.0+-src.tar.gz || exit $?
touch .blast || exit $?
fi
# download, compile, and install R and DADA2
if ! test -e .dada2; then
wget -nv -c https://cran.r-project.org/src/base/R-4/R-4.2.3.tar.gz || exit $?
gnutar -xzf R-4.2.3.tar.gz || exit $?
cd R-4.2.3 || exit $?
perl -i -npe 's/^(\#define NCONNECTIONS) \d+/$1 1050/' src/main/connections.c || exit $?
export CC=clang
export CXX=clang++
tclconfig=`find /opt/local -name tclConfig.sh | sort | tail -n 1`
tkconfig=`find /opt/local -name tkConfig.sh | sort | tail -n 1`
export CURL_CONFIG=`find /opt/local -name curl-config | sort | tail -n 1`
LDFLAGS=-L/opt/local/lib CPPFLAGS=-I/opt/local/include ./configure --prefix=$PREFIX/share/claident --enable-java=no --with-recommended-packages=no --with-pic --with-x=no --with-aqua=no --enable-R-shlib=yes --with-tcl-config=$tclconfig --with-tk-config=$tkconfig --with-libintl-prefix=/opt/local --with-blas="-L/opt/local/lib -lopenblas" --with-lapack r_cv_have_curl728=yes || exit $?
gmake -j$NCPU || exit $?
gmake install-strip 2> /dev/null || sudo gmake install-strip || exit $?
cd .. || exit $?
rm -rf R-4.2.3 || exit $?
if test -w $PREFIX/share/claident/lib/R; then
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","vegan"),repos="https://cloud.r-project.org/",dependencies=T,clean=T,Ncpus=detectCores())' || exit $?
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.26",dependencies=T,clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
else
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","vegan"),repos="https://cloud.r-project.org/",dependencies=T,clean=T,Ncpus=detectCores())' || exit $?
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.26",dependencies=T,clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
fi
rm -f R-4.2.3.tar.gz || exit $?
touch .dada2 || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
