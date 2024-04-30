if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download and install Claident Databases for UCHIME
if ! test -e .cdu; then
mkdir -p $PREFIX/share/claident/uchimedb 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://www.claident.org/uchimedb/20211019/cdu_20211019.tar.xz || exit $?
wget -c https://www.claident.org/uchimedb/20211019/cdu_20211019.tar.xz.sha256 || exit $?
gsha256sum -c cdu_20211019.tar.xz.sha256 || exit $?
rm -f cdu_20211019.tar.xz.sha256 || exit $?
gnutar -xJf cdu_20211019.tar.xz || exit $?
for db in cdu12s cdu16s cducox1 cducytb cdudloop cdumatk cdurbcl cdutrnhpsba
do
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch $db.fasta --output $db.udb || exit $?
chmod 644 $db.fasta $db.udb || exit $?
mv -f $db.fasta $db.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f $db.fasta $db.udb $PREFIX/share/claident/uchimedb/ || exit $?
done
rm -f cdu_20211019.tar.xz || exit $?
echo 'The Claident Databases for UCHIME were installed correctly!'
touch .cdu || exit $?
fi
echo 'You do not need to care about error messages.'
