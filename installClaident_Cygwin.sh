if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, compile, and install Assams
if ! test -e .assams; then
wget -c http://www.fifthdimension.jp/products/assams/assams-0.2.2015.08.08.zip || exit $?
unzip -qq assams-0.2.2015.08.08.zip || exit $?
cd assams-0.2.2015.08.08 || exit $?
sh install_on_Cygwin.sh || exit $?
cd .. || exit $?
rm -rf assams-0.2.2015.08.08 || exit $?
rm -f assams-0.2.2015.08.08.zip || exit $?
touch .assams || exit $?
fi
# download, compile, and install PEAR
if ! test -e .pear; then
wget -c http://sco.h-its.org/exelixis/web/software/pear/files/pear-0.9.6-src.tar.gz || exit $?
tar -xzf pear-0.9.6-src.tar.gz || exit $?
cd pear-0.9.6-src || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX || exit $?
make || exit $?
make install || exit $?
cd .. || exit $?
rm -rf pear-0.9.6-src || exit $?
rm -f pear-0.9.6-src.tar.gz || exit $?
touch .pear || exit $?
fi
# download, and install Claident
if ! test -e .claident; then
wget -c http://www.fifthdimension.jp/products/claident/claident-0.2.2015.11.19.zip || exit $?
unzip -qq claident-0.2.2015.11.19.zip || exit $?
cd claident-0.2.2015.11.19 || exit $?
sh install_on_Cygwin.sh || exit $?
cd .. || exit $?
rm -rf claident-0.2.2015.11.19 || exit $?
rm -f claident-0.2.2015.11.19.zip || exit $?
touch .claident || exit $?
fi
# download , compile, and install VSEARCH
if ! test -e .vsearch; then
wget -c https://github.com/torognes/vsearch/archive/v1.9.10.tar.gz -O vsearch-1.9.10.tar.gz || exit $?
tar -xzf vsearch-1.9.10.tar.gz || exit $?
cd vsearch-1.9.10 || exit $?
sh autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX --disable-pdfman || exit $?
make || exit $?
make install-exec || exit $?
cd .. || exit $?
rm -rf vsearch-1.9.10 || exit $?
rm -f vsearch-1.9.10.tar.gz || exit $?
rm -f $PREFIX/share/claident/bin/vsearch || exit $?
touch .vsearch || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -c ftp://ftp.ncbi.nih.gov/blast/executables/blast+/2.2.31/ncbi-blast-2.2.31+-x64-win64.tar.gz || exit $?
tar -xzf ncbi-blast-2.2.31+-x64-win64.tar.gz || exit $?
cd ncbi-blast-2.2.31+/bin || exit $?
mkdir -p $PREFIX/share/claident/bin || exit $?
mv * $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.2.31+ || exit $?
rm -f ncbi-blast-2.2.31+-x64-win64.tar.gz || exit $?
touch .blast || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
