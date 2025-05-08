# ClaidentInstaller

Automatic installer shell scripts for [Claident](https://github.com/astanabe/Claident).

To learn how to use Claident, see [ClaidentTutorial](https://github.com/astanabe/ClaidentTutorial).

## Notice about conda (Anaconda/Miniconda)

Because conda (or the other environment-modifying packages) interferes these installer scripts, conda need to be disabled temporarily when running these installer scripts.
Running these installer scripts as newly created user is the best solution.

## Notice about UCHIMEDB

This installer no longer install SILVA, RDP Gold, DAIRYdb and UNITE databases because their server often down or require manual registration.
Still, I recommend SILVA SSUParc for prokaryotic 16S, eukaryotic mitochondrial 16S and eukaryotic nuclear 18S (SSU), SILVA LSUParc for prokaryotic 23S and eukaryotic nuclear 28S (LSU), Full UNITE+INSD of all eukaryotes for nuclear ITS.
In order to install FASTA file as UCHIMEDB to your machine, run the following commands AFTER INSTALLATION OF CLAIDENT.

```
#set install prefix (/usr/local by default)
#this must be the same as Claident install prefix (see below)
PREFIX=/usr/local
#set number of processor cores
NCPU=8
#dereplicate sequences
$PREFIX/share/claident/bin/vsearch --fasta_width 0 --notrunclabels --threads $NCPU --strand both --derep_fulllength input.fasta --output input_dereplicated.fasta
#make reverse-complement sequences
$PREFIX/share/claident/bin/vsearch --fasta_width 0 --notrunclabels --threads $NCPU --label_suffix revcomp --fastx_revcomp input_dereplicated.fasta --fastaout input_dereplicated_revcomp.fasta
#join FASTA files
cat input_dereplicated.fasta input_dereplicated_revcomp.fasta > DBNAME.fasta
#install FASTA file to UCHIMEDB path
mv DBNAME.fasta $PREFIX/share/claident/uchimedb/ || sudo mv DBNAME.fasta $PREFIX/share/claident/uchimedb/
```

## Prerequisites

On Debian GNU/Linux compatible distributions, Debian 11 Bullseye, Ubuntu 20.04LTS or Linux Mint 20 or later is required.

On Red Hat Enterprise Linux compatible distributions, Red Hat Enterprise Linux 8, CentOS 8, AlmaLinux 8 or Rocky Linux 8 is required.
Those users need to enable Extra Packages for Enterprise Linux (EPEL) repository before installing Claident.
Red Hat Enterprise Linux users also need to enable CodeReady Linux Builder repository.
CentOS, AlmaLinux or Rocky Linux users need to enable PowerTools (for v8) / CRB (for v9) repository.

On macOS, macOS 10.14 Mojave or later is required.
Mac users need to install Xcode command line tools before installing Claident.
Xcode command line tools can be installed by running the following command in the terminal.

```
xcode-select --install
```

In addition, mac users also need to install 1 of the following package manager.

- [MacPorts](https://www.macports.org/install.php)
- [Homebrew](https://brew.sh/)

If you want to generate wordcloud of community composition by using "clplotwordcloud" command, Google Chrome or Chromium is also required.
On Debian GNU/Linux compatible distributions, the following commands will install Google Chrome to your machines.

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

On Red Hat Enterprise Linux compatible distributions, use the following commands to install Google Chrome.

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf localinstall google-chrome-stable_current_x86_64.rpm
```

On macOS, download installer from [Google](https://www.google.com/chrome), install Google Chrome, and execute the following command in the terminal before running "clplotwordcloud" command.

```
alias google-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
```

## How to use

```
#install Claident and required programs
sh installClaident_Debian.sh
#install optional programs
sh installOptions_Debian.sh
#install BLAST databases and taxonomy databases
sh installDB_Debian.sh
#install reference databases for UCHIME
sh installUCHIMEDB_Debian.sh
```

### If you need proxy to access the internet

Type and run the following commands before installation.

```
export http_proxy=http://server.address:portnumber
export https_proxy=http://server.address:portnumber
export ftp_proxy=http://server.address:portnumber
```

If you need username and password to use proxy, use the following commands instead of the above commands.

```
export http_proxy=http://username:password@server.address:portnumber
export https_proxy=http://username:password@server.address:portnumber
export ftp_proxy=http://username:password@server.address:portnumber
```

### How to change installation PATH

Set PREFIX environment variable before installation like below.

```
export PREFIX=/path/to/instllation/path
#install Claident and required programs
sh installClaident_Debian.sh
#install optional programs
sh installOptions_Debian.sh
#install BLAST databases and taxonomy databases
sh installDB_Debian.sh
#install reference databases for UCHIME
sh installUCHIMEDB_Debian.sh
```

### How to update to new version

Run installation scripts in a new working directory.
