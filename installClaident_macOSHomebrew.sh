brew install openssl make gcc coreutils grep wget unzip gnu-tar gzip xz zlib bzip2 pigz lbzip2 lmdb libomp autoconf automake pkg-config readline pcre2 jpeg libpng cairo pango libtiff tcl-tk openblas libxml2 imagemagick git curl || brew install --build-from-source openssl make gcc coreutils grep wget unzip gnu-tar gzip xz zlib bzip2 pigz lbzip2 lmdb libomp autoconf automake pkg-config readline pcre2 jpeg libpng cairo pango libtiff tcl-tk openblas libxml2 imagemagick git curl aria2 || exit $?
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
BREWPATH=`brew --prefix`
export CC=`ls -d $BREWPATH/bin/gcc-* | ggrep -P '\/gcc-\d+$' | sort | tail -n 1`
export CXX=`ls -d $BREWPATH/bin/g++-* | ggrep -P '\/g\+\+-\d+$' | sort | tail -n 1`
export FC=`ls -d $BREWPATH/bin/gfortran-* | ggrep -P '\/gfortran-\d+$' | sort | tail -n 1`
# download, and install Claident
if ! test -e .claident; then
wget -c https://github.com/astanabe/Claident/archive/v0.9.2024.03.04.tar.gz -O Claident-0.9.2024.03.04.tar.gz || exit $?
gtar -xzf Claident-0.9.2024.03.04.tar.gz || exit $?
cd Claident-0.9.2024.03.04 || exit $?
gmake PREFIX=$PREFIX -j$NCPU || exit $?
gmake PREFIX=$PREFIX install 2> /dev/null || sudo gmake PREFIX=$PREFIX install || exit $?
cp $PREFIX/share/claident/.claident ~/.claident || exit $?
cd .. || exit $?
rm -rf Claident-0.9.2024.03.04 || exit $?
rm -f Claident-0.9.2024.03.04.tar.gz || exit $?
touch .claident || exit $?
fi
# download, compile, and install Swarm
if ! test -e .swarm; then
wget -c https://github.com/torognes/swarm/archive/v3.1.4.tar.gz -O swarm-3.1.4.tar.gz || exit $?
gtar -xzf swarm-3.1.4.tar.gz || exit $?
cd swarm-3.1.4/src || exit $?
perl -i -npe 's/-mtune=generic/-O3 -mtune=native -fomit-frame-pointer -finline-functions/' Makefile || exit $?
gmake -j$NCPU CC=clang CXX=clang++ || exit $?
mkdir -p $PREFIX/share/claident/bin 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv -f swarm $PREFIX/share/claident/bin/ 2> /dev/null || sudo mv -f swarm $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf swarm-3.1.4 || exit $?
rm -f swarm-3.1.4.tar.gz || exit $?
touch .swarm || exit $?
fi
# download, compile, and install VSEARCH
if ! test -e .vsearch; then
wget -c https://github.com/torognes/vsearch/archive/v2.26.1.tar.gz -O vsearch-2.26.1.tar.gz || exit $?
gtar -xzf vsearch-2.26.1.tar.gz || exit $?
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
wget -c https://github.com/astanabe/vsearch5d/archive/v2.26.1.tar.gz -O vsearch5d-2.26.1.tar.gz || exit $?
gtar -xzf vsearch5d-2.26.1.tar.gz || exit $?
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
wget -c https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.15.0/ncbi-blast-2.15.0+-src.tar.gz || exit $?
gtar -xzf ncbi-blast-2.15.0+-src.tar.gz || exit $?
cd ncbi-blast-2.15.0+-src/c++ || exit $?
export CC=clang
export CXX=clang++
BREWPATH=`brew --prefix`
omplib=`find $BREWPATH/Cellar -type f -name libomp.dylib | sort | tail -n 1 | perl -npe 's/\/libomp\.dylib$//'`
ompinclude=`find $BREWPATH/Cellar -type f -name omp.h | sort | tail -n 1 | perl -npe 's/\/omp\.h$//'`
LDFLAGS="-L$omplib -lomp" CPPFLAGS="-I$ompinclude -Xpreprocessor -fopenmp" ./configure --prefix=$PREFIX/share/claident --with-bin-release --without-strip --with-experimental=Int8GI --without-libunwind --with-mt --with-openmp --with-64 --with-lfs --without-debug --without-boost --without-gbench --without-gui --without-ctools || exit $?
gmake -j$NCPU || exit $?
gmake install 2> /dev/null || sudo gmake install || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.15.0+-src || exit $?
rm -f ncbi-blast-2.15.0+-src.tar.gz || exit $?
touch .blast || exit $?
fi
# download, compile, and install R and DADA2
if ! test -e .dada2; then
wget -c https://cran.r-project.org/src/base/R-4/R-4.2.3.tar.gz || exit $?
gtar -xzf R-4.2.3.tar.gz || exit $?
cd R-4.2.3 || exit $?
perl -i -npe 's/^(\#define NCONNECTIONS) \d+/$1 1050/' src/main/connections.c || exit $?
export CC=clang
export CXX=clang++
BREWPATH=`brew --prefix`
tclconfig=`find $BREWPATH/Cellar -type f -name tclConfig.sh | sort | tail -n 1`
tkconfig=`find $BREWPATH/Cellar -type f -name tkConfig.sh | sort | tail -n 1`
openblas=`find $BREWPATH/Cellar -type f -name libopenblas.dylib | sort | tail -n 1 | perl -npe 's/\/libopenblas\.dylib$//'`
lzmalib=`find $BREWPATH/Cellar -type f -name liblzma.dylib | sort | tail -n 1 | perl -npe 's/\/liblzma\.dylib$//'`
lzmainclude=`find $BREWPATH/Cellar -type f -name lzma.h | sort | tail -n 1 | perl -npe 's/\/lzma\.h$//'`
jpeglib=`find $BREWPATH/Cellar -type f -name libjpeg.dylib | sort | tail -n 1 | perl -npe 's/\/libjpeg\.dylib$//'`
jpeginclude=`find $BREWPATH/Cellar -type f -name jpeglib.h | sort | tail -n 1 | perl -npe 's/\/jpeglib\.h$//'`
pcre2lib=`find $BREWPATH/Cellar -type f -name libpcre2-8.dylib | sort | tail -n 1 | perl -npe 's/\/libpcre2-8\.dylib$//'`
pcre2include=`find $BREWPATH/Cellar -type f -name pcre2.h | sort | tail -n 1 | perl -npe 's/\/pcre2\.h$//'`
export CURL_CONFIG=`find $BREWPATH/Cellar -type f -name curl-config | sort | tail -n 1`
omplib=`find $BREWPATH/Cellar -type f -name libomp.dylib | sort | tail -n 1 | perl -npe 's/\/libomp\.dylib$//'`
ompinclude=`find $BREWPATH/Cellar -type f -name omp.h | sort | tail -n 1 | perl -npe 's/\/omp\.h$//'`
quadmathlib=`find $BREWPATH/Cellar -type f -name libquadmath.dylib | sort | tail -n 1 | perl -npe 's/\/libquadmath\.dylib$//'`
LDFLAGS="-L$lzmalib -L$jpeglib -L$pcre2lib -L$omplib -L$quadmathlib" LIBS=-lomp CPPFLAGS="-I$lzmainclude -I$jpeginclude -I$pcre2include -I$ompinclude -Xpreprocessor -fopenmp" FCFLAGS="-static-libgfortran -static-libquadmath" ./configure --prefix=$PREFIX/share/claident --enable-java=no --with-recommended-packages=no --with-pic --with-x=no --with-aqua=no --enable-R-shlib=yes --with-tcl-config=$tclconfig --with-tk-config=$tkconfig --with-blas="-L$openblas -lopenblas" --with-lapack r_cv_have_curl728=yes || exit $?
gmake -j$NCPU || exit $?
rm -rf $PREFIX/share/claident/lib || sudo rm -rf $PREFIX/share/claident/lib || exit $?
gmake install-strip 2> /dev/null || sudo gmake install-strip || exit $?
cd .. || exit $?
rm -rf R-4.2.3 || exit $?
gecho -e 'CC='`ls -d $BREWPATH/bin/gcc-* | ggrep -P '\/gcc-\d+$' | sort | tail -n 1`"\nLDFLAGS=-L$lzmalib -L$jpeglib -L$pcre2lib -L$omplib\nCPPFLAGS=-I$lzmainclude -I$jpeginclude -I$pcre2include -I$ompinclude -fopenmp" > Makevars.vegan
if test -w $PREFIX/share/claident/lib/R; then
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","ggplot2"),repos="https://cloud.r-project.org/",dependencies=T,clean=T,Ncpus=detectCores())' || exit $?
R_MAKEVARS_USER=`pwd`/Makevars.vegan $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages("vegan",repos="https://cloud.r-project.org/",dependencies=T,clean=T,Ncpus=detectCores())' || exit $?
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.26",dependencies=T,clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
else
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","ggplot2"),repos="https://cloud.r-project.org/",dependencies=T,clean=T,Ncpus=detectCores())' || exit $?
R_MAKEVARS_USER=`pwd`/Makevars.vegan sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages("vegan",repos="https://cloud.r-project.org/",dependencies=T,clean=T,Ncpus=detectCores())' || exit $?
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.26",dependencies=T,clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
fi
$PREFIX/share/claident/bin/R --vanilla -e 'library(RcppParallel);library(foreach);library(doParallel);library(htmlwidgets);library(wordcloud2);library(ggplot2);library(vegan);library(dada2)' || exit $?
rm Makevars.vegan || exit $?
rm -f R-4.2.3.tar.gz || exit $?
touch .dada2 || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
