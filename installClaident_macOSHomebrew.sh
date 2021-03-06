brew install make gcc coreutils grep wget unzip gnu-tar xz zlib bzip2 autoconf automake pkg-config readline pcre2 jpeg libpng cairo pango libtiff tcl-tk openblas libxml2 || brew install --build-from-source make gcc coreutils grep wget unzip gnu-tar xz zlib bzip2 autoconf automake pkg-config readline pcre2 jpeg libpng cairo pango libtiff tcl-tk openblas libxml2 || exit $?
if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download , compile, and install Perl modules
if ! test -e .perlmodules; then
sudo -HE sh -c "yes '' | cpan -fi Statistics::Descriptive Statistics::Distributions File::Copy::Recursive DBI DBD::SQLite IO::Compress IO::Compress::Gzip IO::Compress::Bzip2 IO::Compress::Lzma IO::Compress::Xz" || exit $?
touch .perlmodules || exit $?
fi
# download, and install Claident
if ! test -e .claident; then
wget -nv -c https://github.com/astanabe/Claident/archive/v0.9.2020.12.17.tar.gz -O Claident-0.9.2020.12.17.tar.gz || exit $?
gtar -xzf Claident-0.9.2020.12.17.tar.gz || exit $?
cd Claident-0.9.2020.12.17 || exit $?
gmake PREFIX=$PREFIX -j8 || exit $?
gmake PREFIX=$PREFIX install 2> /dev/null || sudo gmake PREFIX=$PREFIX install || exit $?
cp $PREFIX/share/claident/.claident ~/.claident || exit $?
cd .. || exit $?
rm -rf Claident-0.9.2020.12.17 || exit $?
rm -f Claident-0.9.2020.12.17.tar.gz || exit $?
touch .claident || exit $?
fi
# download , compile, and install Swarm
if ! test -e .swarm; then
wget -nv -c https://github.com/torognes/swarm/archive/v3.0.0.tar.gz -O swarm-3.0.0.tar.gz || exit $?
gtar -xzf swarm-3.0.0.tar.gz || exit $?
cd swarm-3.0.0/src || exit $?
perl -i -npe 's/-mtune=generic/-O3 -mtune=native -fomit-frame-pointer -finline-functions/' src/Makefile || exit $?
gmake -j8 || exit $?
mkdir -p $PREFIX/share/claident/bin 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv swarm $PREFIX/share/claident/bin/ 2> /dev/null || sudo mv swarm $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf swarm-3.0.0 || exit $?
rm -f swarm-3.0.0.tar.gz || exit $?
touch .swarm || exit $?
fi
# download , compile, and install VSEARCH
if ! test -e .vsearch; then
wget -nv -c https://github.com/torognes/vsearch/archive/v2.15.1.tar.gz -O vsearch-2.15.1.tar.gz || exit $?
gtar -xzf vsearch-2.15.1.tar.gz || exit $?
cd vsearch-2.15.1 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident --disable-pdfman || exit $?
gmake -j8 || exit $?
if test -e $PREFIX/share/claident/bin/vsearch; then
rm -f $PREFIX/share/claident/bin/vsearch 2> /dev/null || sudo rm -f $PREFIX/share/claident/bin/vsearch || exit $?
fi
gmake install-exec 2> /dev/null || sudo gmake install-exec || exit $?
if ! test -e $PREFIX/bin/vsearch; then
ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch 2> /dev/null || sudo ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch || exit $?
fi
cd .. || exit $?
rm -rf vsearch-2.15.1 || exit $?
rm -f vsearch-2.15.1.tar.gz || exit $?
touch .vsearch || exit $?
fi
# download , compile, and install VSEARCH5D
if ! test -e .vsearch5d; then
wget -nv -c https://github.com/astanabe/vsearch5d/archive/v2.15.1.tar.gz -O vsearch5d-2.15.1.tar.gz || exit $?
gtar -xzf vsearch5d-2.15.1.tar.gz || exit $?
cd vsearch5d-2.15.1 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident || exit $?
gmake -j8 || exit $?
gmake install-exec 2> /dev/null || sudo gmake install-exec || exit $?
cd .. || exit $?
rm -rf vsearch5d-2.15.1 || exit $?
rm -f vsearch5d-2.15.1.tar.gz || exit $?
touch .vsearch5d || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -nv -c https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.11.0/ncbi-blast-2.11.0+-x64-macosx.tar.gz || exit $?
gtar -xzf ncbi-blast-2.11.0+-x64-macosx.tar.gz || exit $?
cd ncbi-blast-2.11.0+/bin || exit $?
mkdir -p $PREFIX/share/claident/bin 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv * $PREFIX/share/claident/bin/ 2> /dev/null || sudo mv * $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.11.0+ || exit $?
rm -f ncbi-blast-2.11.0+-x64-macosx.tar.gz || exit $?
touch .blast || exit $?
fi
# download, compile, and install R and DADA2
if ! test -e .dada2; then
wget -nv -c https://cran.r-project.org/src/base/R-4/R-4.0.3.tar.gz || exit $?
gtar -xzf R-4.0.3.tar.gz || exit $?
cd R-4.0.3 || exit $?
BREWPATH=`brew --prefix`
export CC=`ls -d $BREWPATH/bin/gcc-* | ggrep -P -o 'gcc-\d+' | tail -n 1`
export CXX=`ls -d $BREWPATH/bin/g++-* | ggrep -P -o 'g\+\+-\d+' | tail -n 1`
export FC=`ls -d $BREWPATH/bin/gfortran-* | ggrep -P -o 'gfortran-\d+' | tail -n 1`
tclconfig=`find $BREWPATH/Cellar -name tclConfig.sh | tail -n 1`
tkconfig=`find $BREWPATH/Cellar -name tkConfig.sh | tail -n 1`
openblas=`find $BREWPATH/Cellar -name libopenblas.dylib | tail -n 1 | perl -npe 's/\/libopenblas\.dylib//'`
./configure --prefix=$PREFIX/share/claident --enable-java=no --with-recommended-packages=no --with-pic --with-x=no --with-aqua=no --enable-R-shlib=yes --with-tcl-config=$tclconfig --with-tk-config=$tkconfig --with-blas="-L$openblas -lopenblas" --with-lapack || exit $?
gmake -j8 || exit $?
gmake install-strip 2> /dev/null || sudo gmake install-strip || exit $?
cd .. || exit $?
rm -rf R-4.0.3 || exit $?
if test -w $PREFIX/share/claident/lib/R; then
#$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");install.packages("ape",repos="https://cloud.r-project.org/",dependencies=T,clean=T)' || exit $?
$PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.18",dependencies=T,clean=T,upgrade="never")' || exit $?
else
#sudo $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");install.packages("ape",repos="https://cloud.r-project.org/",dependencies=T,clean=T)' || exit $?
sudo $PREFIX/share/claident/bin/R --vanilla -e 'options(download.file.method="wget");source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("benjjneb/dada2@v1.18",dependencies=T,clean=T,upgrade="never")' || exit $?
fi
rm -f R-4.0.3.tar.gz || exit $?
touch .dada2 || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
