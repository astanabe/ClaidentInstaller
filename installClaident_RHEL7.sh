sudo -E yum install -y binutils gcc gcc-c++ gcc-plugin-devel libstdc++ libgcc glibc-static libstdc++-static bzip2-devel autoconf automake make python wget zlib zlib-devel tar gzip xz unzip coreutils grep perl perl-local-lib perl-Time-HiRes perl-CPAN perl-File-Copy-Recursive perl-YAML perl-DBI perl-DBD-SQLite perl-libwww-perl tcsh || exit $?
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
# download, and install Claident
if ! test -e .claident; then
wget -c https://github.com/astanabe/Claident/archive/v0.2.2019.05.09.tar.gz -O Claident-0.2.2019.05.09.tar.gz || exit $?
tar -xzf Claident-0.2.2019.05.09.tar.gz || exit $?
cd Claident-0.2.2019.05.09 || exit $?
sh install_on_RHEL.sh || exit $?
cd .. || exit $?
rm -rf Claident-0.2.2019.05.09 || exit $?
rm -f Claident-0.2.2019.05.09.tar.gz || exit $?
touch .claident || exit $?
fi
# download , compile, and install Swarm
if ! test -e .swarm; then
wget -c https://github.com/torognes/swarm/archive/v2.2.2.tar.gz -O swarm-2.2.2.tar.gz || exit $?
tar -xzf swarm-2.2.2.tar.gz || exit $?
cd swarm-2.2.2/src || exit $?
make CXXFLAGS="-O3 -mtune=native -fomit-frame-pointer -finline-functions -Icityhash" || exit $?
mkdir -p $PREFIX/share/claident/bin || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv swarm $PREFIX/share/claident/bin/ || sudo mv swarm $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf swarm-2.2.2 || exit $?
rm -f swarm-2.2.2.tar.gz || exit $?
touch .swarm || exit $?
fi
# download , compile, and install VSEARCH
if ! test -e .vsearch; then
wget -c https://github.com/torognes/vsearch/archive/v2.13.3.tar.gz -O vsearch-2.13.3.tar.gz || exit $?
tar -xzf vsearch-2.13.3.tar.gz || exit $?
cd vsearch-2.13.3 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident --disable-pdfman || exit $?
make || exit $?
if test -e $PREFIX/share/claident/bin/vsearch; then
rm -f $PREFIX/share/claident/bin/vsearch || sudo rm -f $PREFIX/share/claident/bin/vsearch || exit $?
fi
make install-exec || sudo make install-exec || exit $?
if ! test -e $PREFIX/bin/vsearch; then
ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch || sudo ln -sf $PREFIX/share/claident/bin/vsearch $PREFIX/bin/vsearch || exit $?
fi
cd .. || exit $?
rm -rf vsearch-2.13.3 || exit $?
rm -f vsearch-2.13.3.tar.gz || exit $?
touch .vsearch || exit $?
fi
# download , compile, and install VSEARCH5D
if ! test -e .vsearch5d; then
wget -c https://github.com/astanabe/vsearch5d/archive/v2.13.3.tar.gz -O vsearch5d-2.13.3.tar.gz || exit $?
tar -xzf vsearch5d-2.13.3.tar.gz || exit $?
cd vsearch5d-2.13.3 || exit $?
sh ./autogen.sh || exit $?
CFLAGS="-O3 -fomit-frame-pointer -finline-functions" CPPFLAGS="-O3 -fomit-frame-pointer -finline-functions" CXXFLAGS="-O3 -fomit-frame-pointer -finline-functions" LDFLAGS="-O3 -fomit-frame-pointer -finline-functions" sh ./configure --prefix=$PREFIX/share/claident || exit $?
make || exit $?
make install-exec || sudo make install-exec || exit $?
cd .. || exit $?
rm -rf vsearch5d-2.13.3 || exit $?
rm -f vsearch5d-2.13.3.tar.gz || exit $?
touch .vsearch5d || exit $?
fi
# download, and install BLAST+
if ! test -e .blast; then
wget -c ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.9.0/ncbi-blast-2.9.0+-x64-linux.tar.gz || exit $?
tar -xzf ncbi-blast-2.9.0+-x64-linux.tar.gz || exit $?
cd ncbi-blast-2.9.0+/bin || exit $?
mkdir -p $PREFIX/share/claident/bin || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv * $PREFIX/share/claident/bin/ || sudo mv * $PREFIX/share/claident/bin/ || exit $?
cd ../.. || exit $?
rm -rf ncbi-blast-2.9.0+ || exit $?
rm -f ncbi-blast-2.9.0+-x64-linux.tar.gz || exit $?
touch .blast || exit $?
fi
echo 'Installation finished correctly!'
echo 'You do not need to care about error messages.'
