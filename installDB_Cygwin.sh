if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, check, and install BLAST and taxonomy databases
if ! test -e .overall; then
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/animals_COX1_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/animals_COX1_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/animals_COX1_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/animals_COX1_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/animals_mt_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/animals_mt_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/animals_mt_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/animals_mt_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/eukaryota_LSU_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/eukaryota_LSU_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/eukaryota_LSU_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/eukaryota_LSU_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/eukaryota_SSU_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/eukaryota_SSU_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/eukaryota_SSU_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/eukaryota_SSU_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/fungi_ITS_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/fungi_ITS_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/fungi_ITS_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/fungi_ITS_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.00.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.00.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.01.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.01.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.02.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.02.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.03.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.03.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.04.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.04.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.05.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.05.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.06.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.06.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.07.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.07.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.08.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.08.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.09.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.09.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.10.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.10.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.11.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.11.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.12.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.12.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.13.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.13.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.14.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.14.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.15.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.15.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.16.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.16.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.17.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.17.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/overall_class.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_matK_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_matK_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_matK_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_matK_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_rbcL_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_rbcL_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_rbcL_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_rbcL_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_trnH-psbA_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_trnH-psbA_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_trnH-psbA_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/plants_trnH-psbA_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/semiall_class.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/semiall_class.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/semiall_class.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/semiall_class.taxdb.tar.xz.sha256 || exit $?
ls *.sha256 | xargs -L 1 -P 4 -I {} sh -c 'sha256sum -c {} || exit $?; rm -f {} || exit $?'
ls *.tar.xz | xargs -L 1 -P 4 -I {} sh -c 'tar -xJf {} || exit $?; rm -f {} || exit $?'
mkdir -p $PREFIX/share/claident/taxdb || exit $?
mv *.taxdb $PREFIX/share/claident/taxdb/ || exit $?
mkdir -p $PREFIX/share/claident/blastdb || exit $?
mv overall_class.??.n?? $PREFIX/share/claident/blastdb/ || exit $?
mv *.n.gil *.nal $PREFIX/share/claident/blastdb/ || exit $?
touch .overall || exit $?
echo 'The "overall" family databases were installed correctly!'
fi
if ! test -e .prokaryota; then
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_16S_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_16S_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_16S_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_16S_genus.taxdb.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.00.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.00.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.01.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.01.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.02.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.02.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.03.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.03.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.04.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.04.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.05.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.05.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.tar.xz.sha256 || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.taxdb.tar.xz || exit $?
wget -c http://fifthdimension.myqnapcloud.com/Database_20160219/prokaryota_all_genus.taxdb.tar.xz.sha256 || exit $?
ls *.sha256 | xargs -L 1 -P 4 -I {} sh -c 'sha256sum -c {} || exit $?; rm -f {} || exit $?'
ls *.tar.xz | xargs -L 1 -P 4 -I {} sh -c 'tar -xJf {} || exit $?; rm -f {} || exit $?'
mkdir -p $PREFIX/share/claident/taxdb || exit $?
mv *.taxdb $PREFIX/share/claident/taxdb/ || exit $?
mkdir -p $PREFIX/share/claident/blastdb || exit $?
mv prokaryota_all_genus.??.n?? $PREFIX/share/claident/blastdb/ || exit $?
mv *.n.gil *.nal $PREFIX/share/claident/blastdb/ || exit $?
touch .prokaryota || exit $?
echo 'The "prokaryota" family databases were installed correctly!'
fi
echo 'You do not need to care about error messages.'
