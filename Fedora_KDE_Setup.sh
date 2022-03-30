#!/bin/bash
#
#########################
# Quick setup script for KDE on Fedora
# version: 1.0
# author: Andi047
# date: 20.12.2021
#########################


# elevate to root priviledges
sudo su


# Fedora groups
fed_groups="Multimedia"
dnf group install -y ${fed_groups}
echo "Specialized Fedora App Groups installed..."


# KDE software
kde_tools="arc gwenview kate kcalc okular spectacle"
dnf install -y ${kde_tools}
echo "KDE software installed..."


# LibreOffice installation
office_base="libreoffice-writer libreoffice-calc libreoffice-impress"
office_kde="libreoffice-kf5"
#office_de="libreoffice-l10n-de" @TODO huntspell ?

dnf install -y ${office_base}
dnf install -y ${office_kde}
#dnf install -y ${office_de}

echo "Office package installed..."


# Proprietary software
# @TODO rpm-fusion


# add programming languages
code_lang="java-11-openjdk-devel"
dnf install -y ${code_lang}
echo "Coding languages installed..."


# install other software
other_soft="firefox nano tlp"
dnf install -y ${other_soft}
echo "Other software installed..."


# exit root mode
exit


# provide user feedback
echo "Quick setup done."
