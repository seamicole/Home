# Home
A repository for persistent setup and configuration files in the Linux home directory

The following steps should be taken upon a fresh install of **Ubuntu 22.04.1 LTS or later**.

## Installing Git

Install git with the following command:

```bash
sudo apt install git -y
```

## Cloning The Repository

Navigate to your home directory and initialize a git repository under branch "main":

```bash
cd ~/ && git init -b main
```

Add the remote repository to your home directory:

```bash
git remote add origin https://github.com/seamicole/Home.git
```

Pull the remote repository into your home directory:

```bash
git pull origin main --allow-unrelated-histories
```

## Running The Installer

Execute the install script:

```bash
bash ~/install.sh
```

## Running A One-liner

Or simply copy, paste, and run this one-liner:

```bash
sudo apt install git -y && cd ~/ && git init -b main && git remote add origin https://github.com/seamicole/Home.git && git pull origin main --allow-unrelated-histories && bash ~/install.sh
```

## Cheatsheets

### Bash

Unzip all files in current directory into directories with the same name:

```bash
for i in *.zip; do unzip "$i" -d "${i%%.zip}"; done
```
