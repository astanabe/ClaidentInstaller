sudo -E dnf install -y --skip-broken which binutils gcc gcc-c++ gcc-gfortran gcc-plugin-devel libstdc++ libgcc glibc-static libstdc++-static readline-devel bzip2-devel autoconf automake make wget zlib zlib-devel tar gzip xz xz-devel pigz lbzip2 unzip coreutils grep perl perl-local-lib perl-Time-HiRes perl-CPAN perl-File-Copy-Recursive perl-YAML perl-DBI perl-DBD-SQLite perl-libwww-perl tcsh libxml2-devel libcurl-devel pcre2-devel libpng-devel libjpeg-turbo-devel cairo-devel pango-devel libtiff-devel tcl-devel tk-devel openblas-devel ImageMagick git-core google-noto-fonts-common || exit $?
if test -z $PREFIX; then
PREFIX=/usr/local || exit $?
fi
# install Perl modules
if ! test -e .perlmodules; then
sudo -HE sh -c "yes '' | cpan -v" || exit $?
sudo -HE sh -c "yes '' | cpan -fi Math::BaseCnv Math::CDF" || exit $?
perl -e 'use Math::BaseCnv;use Math::CDF' || exit $?
touch .perlmodules || exit $?
fi
# set variables
NCPU=`grep -c processor /proc/cpuinfo`
# download, and install Claident
if ! test -e .claident; then
wget -c https://github.com/astanabe/Claident/archive/v0.9.2024.02.21.tar.gz -O Claident-0.9.2024.02.21.tar.gz || exit $?
tar -xzf Claident-0.9.2024.02.21.tar.gz || exit $?
cd Claident-0.9.2024.02.21 || exit $?
make PREFIX=$PREFIX -j$NCPU || exit $?
make PREFIX=$PREFIX install 2> /dev/null || sudo make PREFIX=$PREFIX install || exit $?
cp $PREFIX/share/claident/.claident ~/.claident || exit $?
cd .. || exit $?
rm -rf Claident-0.9.2024.02.21 || exit $?
rm -f Claident-0.9.2024.02.21.tar.gz || exit $?
touch .claident || exit $?
fi
# download, compile, and install Swarm
if ! test -e .swarm; then
wget -c https://github.com/torognes/swarm/archive/v3.1.4.tar.gz -O swarm-3.1.4.tar.gz || exit $?
tar -xzf swarm-3.1.4.tar.gz || exit $?
cd swarm-3.1.4/src || exit $?
perl -i -npe 's/-mtune=generic/-O3 -mtune=native -fomit-frame-pointer -finline-functions/' Makefile || exit $?
make -j$NCPU || exit $?
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
tar -xzf vsearch-2.26.1.tar.gz || exit $?
cd vsearch-2.26.1 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident --disable-pdfman || exit $?
make -j$NCPU || exit $?
if test -e $PREFIX/share/claident/bin/vsearch; then
rm -f $PREFIX/share/claident/bin/vsearch 2> /dev/null || sudo rm -f $PREFIX/share/claident/bin/vsearch || exit $?
fi
make install-exec 2> /dev/null || sudo make install-exec || exit $?
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
tar -xzf vsearch5d-2.26.1.tar.gz || exit $?
cd vsearch5d-2.26.1 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident || exit $?
make -j$NCPU || exit $?
make install-exec 2> /dev/null || sudo make install-exec || exit $?
cd .. || exit $?
rm -rf vsearch5d-2.26.1 || exit $?
rm -f vsearch5d-2.26.1.tar.gz || exit $?
touch .vsearch5d || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -c https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.15.0/ncbi-blast-2.15.0+-x64-linux.tar.gz || exit $?
tar -xzf ncbi-blast-2.15.0+-x64-linux.tar.gz || exit $?
cd ncbi-blast-2.15.0+/bin || exit $?
mkdir -p $PREFIX/share/claident/bin 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv -f * $PREFIX/share/claident/bin/ 2> /dev/null || sudo mv -f * $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.15.0+ || exit $?
rm -f ncbi-blast-2.15.0+-x64-linux.tar.gz || exit $?
touch .blast || exit $?
fi
# download, compile, and install R and DADA2
if ! test -e .dada2; then
wget -c https://cran.r-project.org/src/base/R-4/R-4.2.3.tar.gz || exit $?
tar -xzf R-4.2.3.tar.gz || exit $?
cd R-4.2.3 || exit $?
perl -i -npe 's/^(\#define NCONNECTIONS) \d+/$1 1050/' src/main/connections.c || exit $?
./configure --prefix=$PREFIX/share/claident --enable-java=no --with-recommended-packages=no --with-pic --with-x=no --enable-R-shlib=yes --with-blas=-lopenblas --with-lapack r_cv_have_curl728=yes || exit $?
make -j$NCPU || exit $?
rm -rf $PREFIX/share/claident/lib || sudo rm -rf $PREFIX/share/claident/lib || exit $?
make install-strip 2> /dev/null || sudo make install-strip || exit $?
cd .. || exit $?
rm -rf R-4.2.3 || exit $?
if test -w $PREFIX/share/claident/lib/R; then
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","vegan"),repos="https://cloud.r-project.org/",dependencies=T,clean=T,Ncpus=detectCores())' || exit $?
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.26",dependencies=T,clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
else
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","vegan"),repos="https://cloud.r-project.org/",dependencies=T,clean=T,Ncpus=detectCores())' || exit $?
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.26",dependencies=T,clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
fi
$PREFIX/share/claident/bin/R --vanilla -e 'library(RcppParallel);library(foreach);library(doParallel);library(htmlwidgets);library(wordcloud2);library(vegan);library(dada2)' || exit $?
rm -f R-4.2.3.tar.gz || exit $?
touch .dada2 || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
