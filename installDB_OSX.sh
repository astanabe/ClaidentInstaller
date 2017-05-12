if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, check, and install BLAST and taxonomy databases
if ! test -e .overall; then
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/animals_COX1_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/animals_COX1_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/animals_COX1_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/animals_COX1_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/animals_mt_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/animals_mt_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/animals_mt_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/animals_mt_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/eukaryota_LSU_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/eukaryota_LSU_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/eukaryota_LSU_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/eukaryota_LSU_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/eukaryota_SSU_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/eukaryota_SSU_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/eukaryota_SSU_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/eukaryota_SSU_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/fungi_ITS_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/fungi_ITS_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/fungi_ITS_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/fungi_ITS_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_matK_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_matK_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_matK_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_matK_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_rbcL_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_rbcL_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_rbcL_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_rbcL_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_trnH-psbA_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_trnH-psbA_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_trnH-psbA_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/plants_trnH-psbA_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/semiall_class.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/semiall_class.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/semiall_class.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/semiall_class.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/prokaryota_16S_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/prokaryota_16S_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/prokaryota_16S_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/prokaryota_16S_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/prokaryota_all_genus.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/prokaryota_all_genus.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/prokaryota_all_genus.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/prokaryota_all_genus.taxdb.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.00.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.00.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.01.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.01.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.02.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.02.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.03.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.03.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.04.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.04.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.05.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.05.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.06.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.06.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.07.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.07.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.08.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.08.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.09.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.09.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.10.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.10.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.11.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.11.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.12.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.12.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.13.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.13.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.14.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.14.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.15.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.15.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.16.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.16.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.17.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.17.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.18.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.18.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.19.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.19.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.20.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.20.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.21.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.21.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.22.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.22.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.23.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.23.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.24.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.24.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.25.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.25.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.26.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.26.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.27.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.27.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.28.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.28.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.tar.xz.sha256 || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.taxdb.tar.xz || exit $?
wget --limit-rate=524288 -c https://www.claident.org/blastdb/20170119/overall_class.taxdb.tar.xz.sha256 || exit $?
ls *.sha256 | xargs -L 1 -P 4 -I {} sh -c 'gsha256sum -c {} || exit $?; rm -f {} || exit $?' || exit $?
ls *.tar.xz | xargs -L 1 -P 4 -I {} sh -c 'gnutar -xJf {} || exit $?; rm -f {} || exit $?' || exit $?
mkdir -p $PREFIX/share/claident/taxdb || sudo mkdir -p $PREFIX/share/claident/taxdb || exit $?
mv *.taxdb $PREFIX/share/claident/taxdb/ || sudo mv *.taxdb $PREFIX/share/claident/taxdb/ || exit $?
mkdir -p $PREFIX/share/claident/blastdb || sudo mkdir -p $PREFIX/share/claident/blastdb || exit $?
rm -f $PREFIX/share/claident/blastdb/animals_COX1_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_genus.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_species.* || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_species.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_genus.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_species.* || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_species.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_genus.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species.* || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_genus.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species.* || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species.*
rm -f $PREFIX/share/claident/blastdb/fungi_ITS_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/fungi_ITS_genus.*
rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species.* || sudo rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_species.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_species.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_genus.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species.* || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_genus.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species.* || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species.*
rm -f $PREFIX/share/claident/blastdb/semiall_class.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_class.*
rm -f $PREFIX/share/claident/blastdb/semiall_order.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_order.*
rm -f $PREFIX/share/claident/blastdb/semiall_family.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_family.*
rm -f $PREFIX/share/claident/blastdb/semiall_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_genus.*
rm -f $PREFIX/share/claident/blastdb/semiall_species.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_species.*
rm -f $PREFIX/share/claident/blastdb/overall_class.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_class.*
rm -f $PREFIX/share/claident/blastdb/overall_order.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_order.*
rm -f $PREFIX/share/claident/blastdb/overall_family.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_family.*
rm -f $PREFIX/share/claident/blastdb/overall_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_genus.*
rm -f $PREFIX/share/claident/blastdb/overall_species.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_species.*
mv overall_class.??.n?? $PREFIX/share/claident/blastdb/ || sudo mv overall_class.??.n?? $PREFIX/share/claident/blastdb/ || exit $?
mv *.n.gil *.nal $PREFIX/share/claident/blastdb/ || sudo mv *.n.gil *.nal $PREFIX/share/claident/blastdb/ || exit $?
touch .overall || exit $?
echo 'The "overall" family databases were installed correctly!'
fi
echo 'You do not need to care about error messages.'
