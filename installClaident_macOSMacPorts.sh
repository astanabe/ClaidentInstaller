sudo -E port -N install openssl pkgconfig gmake gcc13 libgcc13 clang-16 llvm-16 libcxx xar coreutils grep wget unzip gnutar xz zlib gzip bzip2 pigz lbzip2 lmdb libomp autoconf automake OpenBLAS pcre2 readline jpeg libpng cairo pango gettext tiff libxml2 tcl tk ImageMagick git curl aria2 || exit $?
if test -z $PREFIX; then
PREFIX=/usr/local || exit $?
fi
# download, compile, and install Perl modules
if ! test -e .perlmodules; then
sudo -HE sh -c "yes '' | cpan -v" || exit $?
sudo -HE sh -c "yes '' | cpan -fi File::Copy::Recursive DBI DBD::SQLite Math::BaseCnv Math::CDF" || exit $?
perl -e 'use File::Copy::Recursive;use DBD::SQLite;use Math::BaseCnv;use Math::CDF' || exit $?
touch .perlmodules || exit $?
fi
# set variables
NCPU=`sysctl -n hw.logicalcpu_max`
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"
export CC=/opt/local/bin/clang-mp-16
export CXX=/opt/local/bin/clang++-mp-16
export FC=/opt/local/bin/gfortran-mp-13
export GCC=/opt/local/bin/gcc-mp-13
export GXX=/opt/local/bin/g++-mp-13
export OBJC=$CC
export OBJCXX=$CXX
# download, and install Claident
if ! test -e .claident; then
wget -c https://github.com/astanabe/Claident/archive/v0.9.2024.08.24.tar.gz -O Claident-0.9.2024.08.24.tar.gz || exit $?
gnutar -xzf Claident-0.9.2024.08.24.tar.gz || exit $?
cd Claident-0.9.2024.08.24 || exit $?
gmake PREFIX=$PREFIX -j$NCPU || exit $?
gmake PREFIX=$PREFIX install 2> /dev/null || sudo gmake PREFIX=$PREFIX install || exit $?
cp $PREFIX/share/claident/.claident ~/.claident || exit $?
cd .. || exit $?
rm -rf Claident-0.9.2024.08.24 || exit $?
rm -f Claident-0.9.2024.08.24.tar.gz || exit $?
touch .claident || exit $?
fi
# download, compile, and install Swarm
if ! test -e .swarm; then
wget -c https://github.com/torognes/swarm/archive/v3.1.5.tar.gz -O swarm-3.1.5.tar.gz || exit $?
gnutar -xzf swarm-3.1.5.tar.gz || exit $?
cd swarm-3.1.5/src || exit $?
perl -i -npe 's/-mtune=generic/-O3 -mtune=native -fomit-frame-pointer -finline-functions/' Makefile || exit $?
gmake -j$NCPU || exit $?
mkdir -p $PREFIX/share/claident/bin 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv -f swarm $PREFIX/share/claident/bin/ 2> /dev/null || sudo mv -f swarm $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf swarm-3.1.5 || exit $?
rm -f swarm-3.1.5.tar.gz || exit $?
touch .swarm || exit $?
fi
# download, compile, and install VSEARCH
if ! test -e .vsearch; then
wget -c https://github.com/torognes/vsearch/archive/v2.28.1.tar.gz -O vsearch-2.28.1.tar.gz || exit $?
gnutar -xzf vsearch-2.28.1.tar.gz || exit $?
cd vsearch-2.28.1 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident --disable-pdfman || exit $?
gmake -j$NCPU || exit $?
if test -e $PREFIX/share/claident/bin/vsearch; then
rm -f $PREFIX/share/claident/bin/vsearch 2> /dev/null || sudo rm -f $PREFIX/share/claident/bin/vsearch || exit $?
fi
gmake install-exec 2> /dev/null || sudo gmake install-exec || exit $?
if ! test -e $PREFIX/bin/vsearch; then
ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch 2> /dev/null || sudo ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch || exit $?
fi
cd .. || exit $?
rm -rf vsearch-2.28.1 || exit $?
rm -f vsearch-2.28.1.tar.gz || exit $?
touch .vsearch || exit $?
fi
# download, compile, and install VSEARCH5D
if ! test -e .vsearch5d; then
wget -c https://github.com/astanabe/vsearch5d/archive/v2.28.1.tar.gz -O vsearch5d-2.28.1.tar.gz || exit $?
gnutar -xzf vsearch5d-2.28.1.tar.gz || exit $?
cd vsearch5d-2.28.1 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident || exit $?
gmake -j$NCPU || exit $?
gmake install-exec 2> /dev/null || sudo gmake install-exec || exit $?
cd .. || exit $?
rm -rf vsearch5d-2.28.1 || exit $?
rm -f vsearch5d-2.28.1.tar.gz || exit $?
touch .vsearch5d || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -c https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.15.0/ncbi-blast-2.15.0+-src.tar.gz || exit $?
gnutar -xzf ncbi-blast-2.15.0+-src.tar.gz || exit $?
cd ncbi-blast-2.15.0+-src/c++ || exit $?
./configure.orig --prefix=$PREFIX/share/claident --with-build-root=./ReleaseMT --with-bin-release --with-strip --with-optimization --with-experimental=Int8GI --without-libunwind --with-mt --with-openmp --with-64 --with-lfs --without-debug --without-boost --without-gbench --without-gui --without-ctools --without-vdb || exit $?
gmake -j$NCPU || exit $?
gmake install 2> /dev/null || sudo gmake install || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.15.0+-src || exit $?
rm -f ncbi-blast-2.15.0+-src.tar.gz || exit $?
touch .blast || exit $?
fi
# download, compile, and install R and DADA2
if ! test -e .dada2; then
wget -c https://cran.r-project.org/src/base/R-4/R-4.3.3.tar.gz || exit $?
gnutar -xzf R-4.3.3.tar.gz || exit $?
cd R-4.3.3 || exit $?
perl -i -npe 's/^(\#define NCONNECTIONS) \d+/$1 1050/' src/main/connections.c || exit $?
tclconfig=`find /opt/local -path /opt/local/var -prune -o -name tclConfig.sh -print | sort | tail -n 1`
tkconfig=`find /opt/local -path /opt/local/var -prune -o -name tkConfig.sh -print | sort | tail -n 1`
quadmathlib=`find /opt/local -path /opt/local/var -prune -o -name libquadmath.dylib -print | grep gcc13 | sort | tail -n 1 | perl -npe 's/\/libquadmath\.dylib$//'`
export CURL_CONFIG=`find /opt/local -path /opt/local/var -prune -o -name curl-config -print | sort | tail -n 1`
export compiler=clang
LDFLAGS="-L/opt/local/lib -L$quadmathlib" CPPFLAGS="-I/opt/local/include" FCFLAGS="-static-libgfortran -static-libquadmath" ./configure --prefix=$PREFIX/share/claident --enable-java=no --with-recommended-packages=yes --with-pic --with-x=no --with-aqua=no --enable-R-shlib=yes --with-tcl-config=$tclconfig --with-tk-config=$tkconfig --with-libintl-prefix=/opt/local --with-blas="-L/opt/local/lib -lopenblas" --with-lapack OBJCXX=$CXX || exit $?
gmake -j$NCPU || exit $?
rm -rf $PREFIX/share/claident/lib || sudo rm -rf $PREFIX/share/claident/lib || exit $?
gmake install-strip 2> /dev/null || sudo gmake install-strip || exit $?
cd .. || exit $?
rm -rf R-4.3.3 || exit $?
gecho -e "CC=$GCC\nCXX=$GXX" > Makevars.vegan
if test -w $PREFIX/share/claident/lib/R; then
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","ggplot2"),repos="https://cloud.r-project.org/",clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
R_MAKEVARS_USER=`pwd`/Makevars.vegan compiler=gcc $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages("vegan",repos="https://cloud.r-project.org/",clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.26",clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
else
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","ggplot2"),repos="https://cloud.r-project.org/",clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
R_MAKEVARS_USER=`pwd`/Makevars.vegan compiler=gcc sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages("vegan",repos="https://cloud.r-project.org/",clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.26",clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
fi
$PREFIX/share/claident/bin/R --vanilla -e 'library(RcppParallel);library(foreach);library(doParallel);library(htmlwidgets);library(wordcloud2);library(ggplot2);library(vegan);library(dada2)' || exit $?
rm -f Makevars.vegan || exit $?
rm -f R-4.3.3.tar.gz || exit $?
touch .dada2 || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
