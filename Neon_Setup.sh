#!/bin/bash
#
#########################
# Quick setup script for KDE Neon
# version: 1.9
# author: Andi047
# date: 23.08.2021
#########################


# elevate to root priviledges
sudo su


# KDE software
kde_tools="kate muon latte-dock kmail korganizer kcalc"
apt install -y ${kde_tools}
echo "KDE software installed..."


# add PPA for newer LibreOffice packages
add-apt-repository -y ppa:libreoffice/libreoffice-still
apt-get update -y


# LibreOffice installation
office_base="libreoffice-writer libreoffice-calc libreoffice-impress"
office_kde="libreoffice-kf5"
office_de="libreoffice-l10n-de"

apt install -y ${office_base}
apt install -y ${office_kde}
apt install -y ${office_de}

echo "Office package installed..."


# Proprietary software
apt install -y kubuntu-restricted-extras
echo "Proprietary packages installed..."


# Creation of 512 MB swap file, change swap value
if [[ ! -f /swapfile ]]; then
  dd if=/dev/zero of=/swapfile bs=1M count=512
  chmod 0600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo "/swapfile   none   swap   sw   0  0" | tee -a /etc/fstab
fi

sysctl vm.swappiness=10
echo "vm.swappiness=10" | tee -a /etc/sysctl.conf
echo "Swapfile created, changed swap values..."


# add programming languages
code_lang="openjdk-17-jdk g++"
apt install -y ${code_lang}
echo "Coding languages installed..."


# install other software
other_soft="tlp"
apt install -y ${other_soft}
echo "Other software installed..."


# exit root mode
exit


# provide user feedback
echo "Quick setup done."
