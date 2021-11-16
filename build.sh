#!/bin/bash
 
playground=""
owncloud_version=""
owncloud_fqdn=""
owncloud_deploy_path=""
owncloud_download_url=""
owncloud_db_name=""
owncloud_db_user=""
owncloud_db_password=""
owncloud_admin_username=""
owncloud_admin_password=""
 
clear
 
echo "Welcome to the initial script"
PS3='Please enter choose your distribution: '
options=("Centos7" "Centos8" "Suse" "Ubuntu" "Vagrant" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Centos7")
        playground="centos7"
            echo "you chose choice $opt"
        break
            ;;
    "Centos8")
            playground="centos8"
            echo "you chose choice $opt"
            break
        ;;
        "Suse")
        playground=suse
            echo "you chose choice Suse"
        break
            ;;
        "Ubuntu")
       playground "ubunutu-minimal"
            echo "you chose choice $REPLY which is $opt"
            break
        ;;
    "Vagrant")
       playground="vagrant"
       echo "Vagrant"
       break
       ;;
        "Quit")
            exit 0
            ;;
        *) echo "invalid option $REPLY";;
    esac
 
done
# $playground="$opt"
echo "playground/inventories/$playground"
 
clear
echo "Select the ownCloud Version to install"
PS3='Please enter choose thw ownCloud version: '
options=("latest" "10.5" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "latest")
            echo "Processing the latest version"
            owncloud_version="latest"   
        break
            ;;
        "10.5")
            owncloud_version="10.5.0"
            break
            ;;
        "10.4")
            owncloud_version="10.4.0"
            break
            ;;
        "Quit")
        exit 0
            #break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
clear
 
read -p "ownCloud deploy path <default /var/www/owncloud>: " owncloud_deploy_path
if [[ -z "$owncloud_deploy_path" ]];  then
   owncloud_deploy_path="/var/www/owncloud"
fi
 
myip=$(hostname -I|cut -f1 -d ' ')
read -p "The ownCloud Address <default: "$myip">: " owncloud_fqdn
# Check if string is empty using -z. For more 'help test'
if [[ -z "$owncloud_fqdn" ]];  then
   owncloud_fqdn=$myip
fi
 
read -p "Database name <default owncloud>: " owncloud_db_name
if [[ -z "$owncloud_db_name" ]];  then
   #  printf '%s\n' "No input entered"
   owncloud_db_name="owncloud"
fi
 
read -p "Database username <default owncloud>: " owncloud_db_user
if [[ -z "$owncloud_db_user" ]];  then
   owncloud_db_user="owncloud"
fi
 
read -p "Database password <default owncloud>: " owncloud_db_password
if [[ -z "$owncloud_db_password" ]];  then
   owncloud_db_password="owncloud"
fi
 
read -p "ownCloud Admin username <default owncloud>: " owncloud_admin_username
if [[ -z "$owncloud_admin_username" ]];  then
   owncloud_admin_username="admin"
fi
read -p "ownCloud Admin password <default owncloud>" owncloud_admin_password
if [[ -z "$owncloud_db_password" ]];  then
   owncloud_admin_password="owncloud"
fi
 
owncloud_download_url="https://download.owncloud.org/community/owncloud-"$owncloud_version".tar.bz2"
playground="playground/inventories/"$playground
 
echo "Resume"
echo ""
echo "owncloud_download_url=" $owncloud_download_url
echo "playground="$playground
echo "owncloud_fqdn="$owncloud_fqdn
echo "owncloud_db_name="$owncloud_db_name
echo "owncloud_fqdn="$owncloud_fqdn
echo "owncloud_db_password="$owncloud_db_password
echo "owncloud_admin_username="$owncloud_admin_username
echo "owncloud_admin_password="$owncloud_admin_password
