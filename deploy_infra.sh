#!/bin/bash

PS3='Choose Actions: '
options=("Deploy VMs" "Configure VMs" "Destroy Infrastructure" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Deploy VMs")
            read -s -p "Type VSphere Password: "
            export TF_VAR_vsphere_password=$REPLY
            current_dir=$PWD;cd terraform/;terraform apply -var-file="vcenter.tfvars";cd $current_dir;
            ./deploy_infra.sh
            break
            ;;
        "Configure VMs")
            while true; do
               read -s -p "Type GitLab Password: " password
               echo
               read -s -p "Retype GitLab Password: " password2
               echo
               [ "$password" = "$password2" ] && break
               echo "Please try again"
            done
            export GITLAB_ROOT_PASSWORD=$password
            current_dir=$PWD;cd ansible/;ansible-playbook playbook-config-all.yml;cd $current_dir;
            ./deploy_infra.sh
            break
            ;;
        "Destroy Infrastructure")
            read -s -p "Type VSphere Password: "
            export TF_VAR_vsphere_password=$REPLY
            current_dir=$PWD;cd terraform/;terraform destroy -var-file="vcenter.tfvars";cd $current_dir;
            ./deploy_infra.sh
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid Option $REPLY";;
    esac
done
