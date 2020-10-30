# ClaidentInstaller

Automatic installer shell scripts for Claident.

## Prerequisites

Mac users need to install Xcode command line tools before installing Claident.
Xcode command line tools can install by running the following command in the terminal.

```
xcode-select --install
```

In addition, mac users also need to install 1 of the following package manager.

- [MacPorts](https://www.macports.org/install.php)
- [Homebrew](https://brew.sh/)

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
