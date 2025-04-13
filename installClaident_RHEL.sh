sudo -E dnf install -y --skip-broken curl libidn perl-Net sqlite-devel cmake cpio libgomp openssl-devel lmdb lmdb-devel which binutils gcc gcc-c++ gcc-gfortran gcc-plugin-devel libstdc++ libgcc glibc-static libstdc++-static readline-devel bzip2-devel autoconf automake make wget zlib zlib-devel tar gzip xz xz-devel pigz pbzip2 lbzip2 unzip coreutils grep perl perl-local-lib perl-Time-HiRes perl-CPAN perl-File-Copy-Recursive perl-YAML perl-DBI perl-DBD-SQLite perl-libwww-perl tcsh libxml2-devel libcurl-devel pcre2-devel libpng-devel libjpeg-turbo-devel cairo-devel pango-devel libtiff-devel tcl-devel tk-devel openblas-devel ImageMagick git-core google-noto-fonts-common aria2 || exit $?
if test -z $PREFIX; then
PREFIX=/usr/local || exit $?
fi
mkdir -p $PREFIX || sudo mkdir -p $PREFIX || exit $?
# install Perl modules
if ! test -e .perlmodules; then
wget http://xrl.us/cpanm || exit $?
chmod 755 cpanm || exit $?
if test -w $PREFIX; then
mkdir -p $PREFIX/share/claident || exit $?
./cpanm -L $PREFIX/share/claident Math::BaseCnv Math::CDF || exit $?
else
sudo -E mkdir -p $PREFIX/share/claident || exit $?
sudo -E ./cpanm -L $PREFIX/share/claident Math::BaseCnv Math::CDF || exit $?
fi
perl -I$PREFIX/share/claident/lib/perl5 -e 'use File::Copy::Recursive;use DBD::SQLite;use Math::BaseCnv;use Math::CDF' || exit $?
rm -f cpanm || exit $?
touch .perlmodules || exit $?
fi
# set variables
NCPU=`grep -c processor /proc/cpuinfo`
# download, and install Claident
if ! test -e .claident; then
wget -c https://github.com/astanabe/Claident/archive/v0.9.2025.04.13.tar.gz -O Claident-0.9.2025.04.13.tar.gz || exit $?
tar -xzf Claident-0.9.2025.04.13.tar.gz || exit $?
cd Claident-0.9.2025.04.13 || exit $?
make PREFIX=$PREFIX -j$NCPU || exit $?
make PREFIX=$PREFIX install 2> /dev/null || sudo make PREFIX=$PREFIX install || exit $?
cp $PREFIX/share/claident/.claident ~/.claident || exit $?
cd .. || exit $?
rm -rf Claident-0.9.2025.04.13 || exit $?
rm -f Claident-0.9.2025.04.13.tar.gz || exit $?
touch .claident || exit $?
fi
# download, compile, and install Swarm
if ! test -e .swarm; then
wget -c https://github.com/torognes/swarm/archive/v3.1.5.tar.gz -O swarm-3.1.5.tar.gz || exit $?
tar -xzf swarm-3.1.5.tar.gz || exit $?
cd swarm-3.1.5/src || exit $?
perl -i -npe 's/-mtune=generic/-O2 -mtune=native -fomit-frame-pointer -finline-functions/' Makefile || exit $?
make -j$NCPU || exit $?
mkdir -p $PREFIX/share/claident/bin 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv -f swarm $PREFIX/share/claident/bin/ 2> /dev/null || sudo mv -f swarm $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf swarm-3.1.5 || exit $?
rm -f swarm-3.1.5.tar.gz || exit $?
touch .swarm || exit $?
fi
# download, compile, and install VSEARCH
if ! test -e .vsearch; then
wget -c https://github.com/torognes/vsearch/archive/v2.30.0.tar.gz -O vsearch-2.30.0.tar.gz || exit $?
tar -xzf vsearch-2.30.0.tar.gz || exit $?
cd vsearch-2.30.0 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O2 -mtune=native -fomit-frame-pointer -finline-functions" CPPFLAGS="-O2 -mtune=native -fomit-frame-pointer -finline-functions" CXXFLAGS="-O2 -mtune=native -fomit-frame-pointer -finline-functions" LDFLAGS="-O2 -mtune=native -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident --disable-pdfman || exit $?
make -j$NCPU || exit $?
if test -e $PREFIX/share/claident/bin/vsearch; then
rm -f $PREFIX/share/claident/bin/vsearch 2> /dev/null || sudo rm -f $PREFIX/share/claident/bin/vsearch || exit $?
fi
make install-exec 2> /dev/null || sudo make install-exec || exit $?
if ! test -e $PREFIX/bin/vsearch; then
ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch 2> /dev/null || sudo ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch || exit $?
fi
cd .. || exit $?
rm -rf vsearch-2.30.0 || exit $?
rm -f vsearch-2.30.0.tar.gz || exit $?
touch .vsearch || exit $?
fi
# download, compile, and install VSEARCH5D
if ! test -e .vsearch5d; then
wget -c https://github.com/astanabe/vsearch5d/archive/v2.30.0.tar.gz -O vsearch5d-2.30.0.tar.gz || exit $?
tar -xzf vsearch5d-2.30.0.tar.gz || exit $?
cd vsearch5d-2.30.0 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O2 -mtune=native -fomit-frame-pointer -finline-functions" CPPFLAGS="-O2 -mtune=native -fomit-frame-pointer -finline-functions" CXXFLAGS="-O2 -mtune=native -fomit-frame-pointer -finline-functions" LDFLAGS="-O2 -mtune=native -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident || exit $?
make -j$NCPU || exit $?
make install-exec 2> /dev/null || sudo make install-exec || exit $?
cd .. || exit $?
rm -rf vsearch5d-2.30.0 || exit $?
rm -f vsearch5d-2.30.0.tar.gz || exit $?
touch .vsearch5d || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -c https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.15.0/ncbi-blast-2.15.0+-src.tar.gz || exit $?
tar -xzf ncbi-blast-2.15.0+-src.tar.gz || exit $?
cd ncbi-blast-2.15.0+-src/c++ || exit $?
./configure.orig --prefix=$PREFIX/share/claident --with-build-root=./ReleaseMT --with-bin-release --with-strip --with-optimization --with-experimental=Int8GI --without-libunwind --with-mt --with-openmp --with-64 --with-lfs --without-debug --without-boost --without-gbench --without-gui --without-ctools --without-vdb || exit $?
make -j$NCPU || exit $?
make install 2> /dev/null || sudo make install || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.15.0+-src || exit $?
rm -f ncbi-blast-2.15.0+-src.tar.gz || exit $?
touch .blast || exit $?
fi
# download, compile, and install R and DADA2
if ! test -e .dada2; then
wget -c https://cran.r-project.org/src/base/R-4/R-4.4.3.tar.xz || exit $?
tar -xJf R-4.4.3.tar.xz || exit $?
cd R-4.4.3 || exit $?
perl -i -npe 's/^(static int NCONNECTIONS =) \d+/$1 1050/' src/main/connections.c || exit $?
./configure --prefix=$PREFIX/share/claident --enable-java=no --with-recommended-packages=yes --with-pic --with-x=no --enable-R-shlib=yes --with-blas=-lopenblas --with-lapack || exit $?
make -j$NCPU || exit $?
rm -rf $PREFIX/share/claident/lib || sudo rm -rf $PREFIX/share/claident/lib || exit $?
make install-strip 2> /dev/null || sudo make install-strip || exit $?
cd .. || exit $?
rm -rf R-4.4.3 || exit $?
if test -w $PREFIX/share/claident/lib/R; then
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","ggplot2","vegan","remotes"),repos="https://cloud.r-project.org/",clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);library(remotes);install_bioc(c("3.20/BiocParallel","3.20/Rhtslib","3.20/Rsamtools","3.20/ShortRead","3.20/dada2"),clean=T,Ncpus=detectCores(),upgrade="always")' || exit $?
else
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);install.packages(c("RcppParallel","foreach","doParallel","htmlwidgets","wordcloud2","ggplot2","vegan","remotes"),repos="https://cloud.r-project.org/",clean=T,Ncpus=detectCores(),upgrade="never")' || exit $?
sudo -E $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");library(parallel);library(remotes);install_bioc(c("3.20/BiocParallel","3.20/Rhtslib","3.20/Rsamtools","3.20/ShortRead","3.20/dada2"),clean=T,Ncpus=detectCores(),upgrade="always")' || exit $?
fi
$PREFIX/share/claident/bin/R --vanilla -e 'library(RcppParallel);library(foreach);library(doParallel);library(htmlwidgets);library(wordcloud2);library(ggplot2);library(vegan);library(dada2)' || exit $?
rm -f R-4.4.3.tar.xz || exit $?
touch .dada2 || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
