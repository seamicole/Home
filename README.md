# Home
A repository for persistent setup and configuration files in the Linux home directory

The following steps should be taken upon a fresh install of **Ubuntu 22.04.1 LTS or later**.

## Installing Git

Install git with the following command:

```bash
sudo apt install git
```

## Cloning The Repository

Navigate to your home directory and initialize a git repository:

```bash
cd ~/ && git init
```

Add the remote repository to your home directory:

```bash
git remote add origin https://github.com/seamicole/home.git
```

Pull the remote repository into your home directory:

```bash
git pull origin main --allow-unrelated-histories
```

## Running The Installer

Execute the install script:

```bash
sudo chmod +x ~/install.sh && sudo bash ~/install.sh
```
