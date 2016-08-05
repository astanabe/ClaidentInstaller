sudo yum install -y wget unzip zlib-devel bzip2-devel autoconf automake || exit $?
if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, compile, and install Assams
if ! test -e .assams; then
wget -c https://www.fifthdimension.jp/products/assams/assams-0.2.2015.08.08.zip || exit $?
unzip -qq assams-0.2.2015.08.08.zip || exit $?
cd assams-0.2.2015.08.08 || exit $?
sh install_on_RHEL7.sh || exit $?
cd .. || exit $?
rm -rf assams-0.2.2015.08.08 || exit $?
rm -f assams-0.2.2015.08.08.zip || exit $?
touch .assams || exit $?
fi
# download, compile, and install PEAR
if ! test -e .pear; then
wget -c https://github.com/xflouris/PEAR/archive/master.tar.gz -O PEAR-master.tar.gz || exit $?
tar -xzf PEAR-master.tar.gz || exit $?
cd PEAR-master || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX || exit $?
make || exit $?
make install || sudo make install || exit $?
cd .. || exit $?
rm -rf PEAR-master || exit $?
rm -f PEAR-master.tar.gz || exit $?
touch .pear || exit $?
fi
# download, and install Claident
if ! test -e .claident; then
wget -c https://www.fifthdimension.jp/products/claident/claident-0.2.2016.07.05.zip || exit $?
unzip -qq claident-0.2.2016.07.05.zip || exit $?
cd claident-0.2.2016.07.05 || exit $?
sh install_on_RHEL.sh || exit $?
cd .. || exit $?
rm -rf claident-0.2.2016.07.05 || exit $?
rm -f claident-0.2.2016.07.05.zip || exit $?
touch .claident || exit $?
fi
# download , compile, and install VSEARCH
if ! test -e .vsearch; then
wget -c https://github.com/torognes/vsearch/archive/v2.0.0.tar.gz -O vsearch-2.0.0.tar.gz || exit $?
tar -xzf vsearch-2.0.0.tar.gz || exit $?
cd vsearch-2.0.0 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident --disable-pdfman || exit $?
make || exit $?
if test -e $PREFIX/share/claident/bin/vsearch; then
rm $PREFIX/share/claident/bin/vsearch || sudo rm $PREFIX/share/claident/bin/vsearch || exit $?
fi
make install-exec || sudo make install-exec || exit $?
if ! test -e $PREFIX/bin/vsearch; then
ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch || sudo ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch || exit $?
fi
cd .. || exit $?
rm -rf vsearch-2.0.0 || exit $?
rm -f vsearch-2.0.0.tar.gz || exit $?
touch .vsearch || exit $?
fi
# download , compile, and install VSEARCH5D
if ! test -e .vsearch5d; then
wget -c https://github.com/astanabe/vsearch5d/archive/v2.0.0.tar.gz -O vsearch5d-2.0.0.tar.gz || exit $?
tar -xzf vsearch5d-2.0.0.tar.gz || exit $?
cd vsearch5d-2.0.0 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident || exit $?
make || exit $?
make install-exec || sudo make install-exec || exit $?
cd .. || exit $?
rm -rf vsearch5d-2.0.0 || exit $?
rm -f vsearch5d-2.0.0.tar.gz || exit $?
touch .vsearch5d || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -c ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.4.0/ncbi-blast-2.4.0+-x64-linux.tar.gz || exit $?
tar -xzf ncbi-blast-2.4.0+-x64-linux.tar.gz || exit $?
cd ncbi-blast-2.4.0+/bin || exit $?
mkdir -p $PREFIX/share/claident/bin || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv * $PREFIX/share/claident/bin/ || sudo mv * $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.4.0+ || exit $?
rm -f ncbi-blast-2.4.0+-x64-linux.tar.gz || exit $?
touch .blast || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
