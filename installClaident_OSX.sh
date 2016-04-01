sudo port install gcc48 +universal coreutils gmake wget unzip gnutar xz +universal zlib +universal bzip2 +universal autoconf automake build_arch=x86_64 universal_archs="x86_64 i386" || exit $?
if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, compile, and install Assams
if ! test -e .assams; then
wget -c http://www.fifthdimension.jp/products/assams/assams-0.2.2015.08.08.zip || exit $?
unzip -qq assams-0.2.2015.08.08.zip || exit $?
cd assams-0.2.2015.08.08 || exit $?
sh install_on_OSX.sh || exit $?
cd .. || exit $?
rm -rf assams-0.2.2015.08.08 || exit $?
rm -f assams-0.2.2015.08.08.zip || exit $?
touch .assams || exit $?
fi
# download, compile, and install PEAR
if ! test -e .pear; then
wget -c http://sco.h-its.org/exelixis/web/software/pear/files/pear-0.9.6-src.tar.gz || exit $?
gnutar -xzf pear-0.9.6-src.tar.gz || exit $?
cd pear-0.9.6-src || exit $?
CC=gcc-mp-4.8 CXX=g++-mp-4.8 CFLAGS="-O3 -m64 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -m64 -fomit-frame-pointer -finline-functions" CPPFLAGS="-I/opt/local/include" LDFLAGS="-O3 -m64 -L/opt/local/lib" sh ./configure --prefix=$PREFIX || exit $?
gmake || exit $?
gmake install || sudo gmake install || exit $?
cd .. || exit $?
rm -rf pear-0.9.6-src || exit $?
rm -f pear-0.9.6-src.tar.gz || exit $?
touch .pear || exit $?
fi
# download, and install Claident
if ! test -e .claident; then
wget -c http://www.fifthdimension.jp/products/claident/claident-0.2.2016.03.11.zip || exit $?
unzip -qq claident-0.2.2016.03.11.zip || exit $?
cd claident-0.2.2016.03.11 || exit $?
sh install_on_OSX.sh || exit $?
cd .. || exit $?
rm -rf claident-0.2.2016.03.11 || exit $?
rm -f claident-0.2.2016.03.11.zip || exit $?
touch .claident || exit $?
fi
# download , compile, and install VSEARCH
if ! test -e .vsearch; then
wget -c https://github.com/torognes/vsearch/archive/v1.10.2.tar.gz -O vsearch-1.10.2.tar.gz || exit $?
gnutar -xzf vsearch-1.10.2.tar.gz || exit $?
cd vsearch-1.10.2 || exit $?
CC=gcc-mp-4.8 CXX=g++-mp-4.8 CFLAGS="-O3 -m64 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -m64 -fomit-frame-pointer -finline-functions" CPPFLAGS="-I/opt/local/include" LDFLAGS="-O3 -m64 -L/opt/local/lib" sh ./configure --prefix=$PREFIX --disable-pdfman || exit $?
gmake || exit $?
gmake install-exec || sudo gmake install-exec || exit $?
ln -sf $PREFIX/bin/vsearch $PREFIX/share/claident/bin/vsearch || sudo ln -sf $PREFIX/bin/vsearch $PREFIX/share/claident/bin/vsearch || exit $?
cd .. || exit $?
rm -rf vsearch-1.10.2 || exit $?
rm -f vsearch-1.10.2.tar.gz || exit $?
touch .vsearch || exit $?
fi
# download , compile, and install VSEARCH5D
if ! test -e .vsearch5d; then
wget -c https://github.com/astanabe/vsearch5d/archive/1.10.2.tar.gz -O vsearch5d-1.10.2.tar.gz || exit $?
gnutar -xzf vsearch5d-1.10.2.tar.gz || exit $?
cd vsearch5d-1.10.2 || exit $?
CC=gcc-mp-4.8 CXX=g++-mp-4.8 CFLAGS="-O3 -m64 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -m64 -fomit-frame-pointer -finline-functions" CPPFLAGS="-I/opt/local/include" LDFLAGS="-O3 -m64 -L/opt/local/lib" sh ./configure --prefix=$PREFIX/share/claident || exit $?
gmake || exit $?
gmake install-exec || sudo gmake install-exec || exit $?
cd .. || exit $?
rm -rf vsearch5d-1.10.2 || exit $?
rm -f vsearch5d-1.10.2.tar.gz || exit $?
touch .vsearch5d || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -c ftp://ftp.ncbi.nih.gov/blast/executables/blast+/2.3.0/ncbi-blast-2.3.0+-universal-macosx.tar.gz || exit $?
gnutar -xzf ncbi-blast-2.3.0+-universal-macosx.tar.gz || exit $?
cd ncbi-blast-2.3.0+/bin || exit $?
mkdir -p $PREFIX/share/claident/bin || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv * $PREFIX/share/claident/bin/ || sudo mv * $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.3.0+ || exit $?
rm -f ncbi-blast-2.3.0+-universal-macosx.tar.gz || exit $?
touch .blast || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
