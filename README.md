# Docker
Docker course notes for personal use 2021.

## What is docker?
A platform for building, running and shipping applications in a consistent manager.

## Why development project is not running well to another system.
### Reasons:
* One or more file missing
* Software version mismatch
* Different configuration settings

with docker we can package (node 14, mongo 4, app) the application and run anywhere in the system.

# Virtual Machines vs Containers
## Container 
An isolated environment for running an application

## Virtual Machine (VM)
An abstraction of a machine (Physical Hardware) - We can run several virtaul machine on a real physical machine. for example MacOS we can run Windows and Linux using tool called "Hypervisor (VirtaulBox, VMWare, and Hyper-v only for windows)".

## What is the benefit of building VM?
As a software developer we can run an application in isolation inside a virtual machine so in the same physical machine we can run two different virtual machine each running completely different application and each running application has the exact dependency it needs. For example Applicaiton version 1 using Node 14 and Mongo 4 while Application version 2 using Node 9 and Mongo 3 all these are running on same machine but in different isolated environments thats benefits of the virtual machine. But there are number of problems.
* Each VM needs a full-blown OS (full copy of OS that needs a license key) that's why these VMs are 
* Slow to start because the entire os has to be loaded just like restarting your computer.
* Resource Intensive - because each virtual machine takes slice of actual physical hardware resources like `CPU, Memory and Disk Space`

![Virtual Maching](https://user-images.githubusercontent.com/50256921/116961943-9d334700-acdf-11eb-9d4e-974bd9a8f511.png)


## Containers
* Contaier give us same kind of isolation so
* Allow running multiple apps in isolation - But they are
* more light weight - they don't need a full operating system.
* Infact all containers on a single machine shared a operating system of the host (Use OS of the host) so that means we need to license, patch and monitor a single operating system. Also because the operating system already started on the host
* A Container can start-up prety quickly usally in a second sometimes less and also the container don't need slice of hardware resources on the host.
* Need less hardware resources. It means we don't need to give specific numbers of CPU cores slice of memory or Disk Space. So in a single host we can run 10s or even can run 100s of containers side by side.

# Docker Architecture
Docker uses a client sever architecture so it has a client component talks to a server component using a `REST API`. The server also called docker engine set on the background and takes care of building and running docker container.

![Docker Architecture](https://user-images.githubusercontent.com/50256921/116962609-665e3080-ace1-11eb-9663-2ff25596bf42.png)

Technically a container is just a process like other processes runing on the computer. More accuratly the containers shared the Kernel of the host. Kernel is the core of the operating system it's like the engine of the car. A Kernel manages applications and hardware resources.

# Installing Docker
* if already installed Docker and recommned to upgrade to latest version `docker version` 

# Development Workflow
When using a Docker to start-up we have to take an application and it does not matter what kind of application it is or how it builds we take an application and dockerized it which means we make small change so that it can be run by docker. How? we just add a docker file to that application. A docker file is a plain text file that includes instructions that docker usages to package the appliation into an image. The image contains everything our application needs to run.

![Development Workflow](https://user-images.githubusercontent.com/50256921/116964470-922fe500-ace6-11eb-943f-1bafdbef510a.png)


##  Image
* A cut-down OS
* A runtime environment (Eg: Node, Python)
* It also include Application files 
* Third-party libraries
* Environment variables
So we create a docker file and give it to Docker for packaging our application into an image.
- Once we have a image we tell docker to start container using that image. So the container is a process but it's a special process because it has it's own file system which is provided by the image. So our application gets loaded inside the container or a process and this is how we run our application on locally on our development machines. So instead of runing directly lunching the application and runing it into typical process we tell docker to run inside a container in an isolated environment.

## Beauty of a Docker.
Once we have a image can push it into registry (docker-hup is like github for git it's a storage for a docker images that anyone can use) so once images in docker-hub then we can pull it on any machine that run docker this machine has same image that we have on Development machine which contains specific version of our application with everything it needs. So we can start a application the same way started on a Development machine. So with docker we no longer need to maintain long complex release documents have to be precisily followed. All the instruction for building image of an application are written in docker-file with that we can package our application into an image and run it virtually anywhere.

![Beauty-of-Docker](https://user-images.githubusercontent.com/50256921/116966478-3d429d80-aceb-11eb-9a7b-a4c7756874b2.png)

## Docker in Action
1. `Create a folder called 'hello-docker' in any desktop`
2. `Create a file called app.js and write code console.log("Hello Docker!");`
3. `and run using node app.js`

### Instructions
1. Start with an OS
2. Install Node
3. Copy app files
4. Run node app.js

The above program and instruction is quite simple but what if the really complex program and needs to follow-up the documents. That's why here is a docker to rescue  this problem. 
```Dockerfile
FROM node:alpine
COPY . /app
WORKDIR /app
CMD node app.js
```
and we have to package our application to image
`docker build -t hello-docker .` here -t flags means 'tags' which helps to identify the image name which is called 'hello-docker' and . means save location.

# The Linux Command Line
## Linux Distribution
1. Ubuntu
2. Fedora
3. Centos
4. Alpine and so on.

Install/Run Docker from docker image.
`docker run ubuntu` OR `docker pull ubuntu`
* To see the docker running process
`docker ps`

* To see the running and stop docker process
`docker ps -a`

### Running Linux
* To run the ubuntu in inter-active mode and it will open the shell prompt.
`docker run -it ubuntu` -it flags means interactive.
* to see the location of the user in `echo $0`
* to view the user `whoami`
* to view all previous used command in the terminal `history`
* to view recent used two command `!2`

### Managing Packages
Now a days most of the operating system comes up with the `Package Managers`
1. npm
2. yarn
3. pip
4. NuGet and so on
same as in the ubuntu operating system has package manager called `apt` which called advanced package tool.
Whe you try to install a package called nano 
```Linux
root@033d3a680e64:/# apt install nano
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package nano
root@033d3a680e64:/#
```
It gives the above error its because it could not find the package in the local database so we have to update the package using 
`apt update` and try `apt install nano`
* to uninstall the programm `apt remove nano`

### Linux file system
`/` which is called root directory
1. / – Root
Every single file and directory starts from the root directory.
Only root user has write privilege under this directory.
Please note that /root is root user’s home directory, which is not same as /.
2. /bin – User Binaries
Contains binary executables.
Common linux commands you need to use in single-user modes are located under this directory.
Commands used by all the users of the system are located here.
For example: ps, ls, ping, grep, cp.
3. /sbin – System Binaries
Just like /bin, /sbin also contains binary executables.
But, the linux commands located under this directory are used typically by system aministrator, for system maintenance purpose.
For example: iptables, reboot, fdisk, ifconfig, swapon
4. /etc – Configuration Files
Contains configuration files required by all programs.
This also contains startup and shutdown shell scripts used to start/stop individual programs.
For example: /etc/resolv.conf, /etc/logrotate.conf
5. /dev – Device Files
Contains device files.
These include terminal devices, usb, or any device attached to the system.
For example: /dev/tty1, /dev/usbmon0
6. /proc – Process Information
Contains information about system process.
This is a pseudo filesystem contains information about running process. For example: /proc/{pid} directory contains information about the process with that particular pid.
This is a virtual filesystem with text information about system resources. For example: /proc/uptime
7. /var – Variable Files
var stands for variable files.
Content of the files that are expected to grow can be found under this directory.
This includes — system log files (/var/log); packages and database files (/var/lib); emails (/var/mail); print queues (/var/spool); lock files (/var/lock); temp files needed across reboots (/var/tmp);
8. /tmp – Temporary Files
Directory that contains temporary files created by system and users.
Files under this directory are deleted when system is rebooted.
9. /usr – User Programs
Contains binaries, libraries, documentation, and source-code for second level programs.
/usr/bin contains binary files for user programs. If you can’t find a user binary under /bin, look under /usr/bin. For example: at, awk, cc, less, scp
/usr/sbin contains binary files for system administrators. If you can’t find a system binary under /sbin, look under /usr/sbin. For example: atd, cron, sshd, useradd, userdel
/usr/lib contains libraries for /usr/bin and /usr/sbin
/usr/local contains users programs that you install from source. For example, when you install apache from source, it goes under /usr/local/apache2
10. /home – Home Directories
Home directories for all users to store their personal files.
For example: /home/john, /home/nikita
11. /boot – Boot Loader Files
Contains boot loader related files.
Kernel initrd, vmlinux, grub files are located under /boot
For example: initrd.img-2.6.32-24-generic, vmlinuz-2.6.32-24-generic
12. /lib – System Libraries
Contains library files that supports the binaries located under /bin and /sbin
Library filenames are either ld* or lib*.so.*
For example: ld-2.11.1.so, libncurses.so.5.7
13. /opt – Optional add-on Applications
opt stands for optional.
Contains add-on applications from individual vendors.
add-on applications should be installed under either /opt/ or /opt/ sub-directory.
14. /mnt – Mount Directory
Temporary mount directory where sysadmins can mount filesystems.
15. /media – Removable Media Devices
Temporary mount directory for removable devices.
For examples, /media/cdrom for CD-ROM; /media/floppy for floppy drives; /media/cdrecorder for CD writer
16. /srv – Service Data
srv stands for service.
Contains server specific services related data.
For example, /srv/cvs contains CVS related data.

### Navigating the file system
`pwd` which called print working directory.
* to see all the list in a single line `ls -1` or with long `ls -l` 
* to navigate into the folder `cd directory_name`
* to navigate into the home directory `cd ~`
* to view all the command list `ls /bin`

### Manipulating Files and Directories
* blue color represents Folder in linux
* to create folder `mkdir directory_name`
* to create file `touch file_name or touch file1 file2 file3 file4`
* to delete multiple file or single file `rm file_name` or `rm file1 file2` or delete all file start with file `rm file*`
* to delete folder `rm -r folder_name` -r is short for reccursive 
* to rename file or directory `mv old_name new_name`

### Editing and Viewing Files
* `cat` to show the content of the small file
* `more` to view large content of file use space or enter key to navigate to another line
* `less` to view large content of file with up and down arrow key (`apt install less`)
* `head` to view the first line of the file and we can pass the flag `head -n 5 /etc/adduser.conf`
* `tail` to view the last line of the file `tail -n 5 /etc/adduser.conf`

### Redirection
* `>` redirection operator
* `cat` is the short for the concatination. 
* to write the content of one file to another file `cat text1.txt > text2.txt`.
* to view the content of the both file `cat text1.txt text2.txt`.
* to write the content using echo `echo Hello Docker > hello.txt` it will create a text file and write a conent Hello Docker into it.
* We can combine many files to one file example `text1.txt text2.txt > combined.txt`.

### Searching for text
Regular Expression is a case sensitive.
* `grep` which is short for global regular expression for example `grep Hello text1.txt` it will search Hello word in text1.txt file.
* To search the text in case insensitive `grep -i hello text1.txt`
* to search the text in current directory `grep -i -r hello .` or `grep -ir hello .`

### Finding file and Directoris
`find` this command will show all the files and directories in the current directry.
* to find the directory only `find -type d`
* to find the files only `find -type f` or `find -type f --name "f*"` this means file start with name f.

### Chaining Commands
Chaining commands in Linux allows us to execute multiple commands at the same time and directly through the terminal. It's like short shell scripts that can be executed through the terminal directly. ... It allows us to run multiple commands in succession or simultaneously.

* for example: `mkdir test; cd test; echo done` this will execute other command if one command is fail.
* `mkdir test && cd test && echo done` this will not execute if one command is failed.
* `mkdir test || echo "Directory Exists"` if the first command is filed will execute second command if not second command will not execute.
* `ls /bin | head/tail/less`
* to write the command in a single line `mkdir test;\ > cd test;\ > echo done` 

### Environment Variable
In Linux and Unix based systems environment variables are a set of dynamic named values, stored within the system that are used by applications launched in shells or subshells.
* `printenv` to view all the environment configuration
* `printenv PATH` it will print `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin` or prifix by $ sign `echo $PATH` will return same result
* `ls -a` it will return hidden files and directory

NOTE: To set the value for temporary purpose for any variable `export DB_USER="Rudra"` and `echo $DB_USER`
NOTE: To set the value for permanent purpose for any variable `echo COLOR=Blue >> .bashrc`
if we could not see the value from home directory run these command `source ~/ .bashrc` and `echo $COLOR`

### Managing Processes 
Process is an instance of a running programm. To view all the running instances or programs we can use `ps` command.
* `sleep 100` this command will make terminal sleep for 100 seconds and see the process using `ps` command
* to `kill` the process use `kill process_id` command.

### Managing Users
#### How to create new users and login with that users
* `useradd` - to add user. To see the option just run the `useradd` or `adduser`(this interactive mode) command. -m or --create-home (creates the user's home directory).
  * To add user `user add -m user_name` for eg. `user add -m magar`
  * where the user stored? Well, it will stored in `/etc/passwd` file. So to view the user account use this `cat /etc/passwd` command. It will return like this `magar:x:1000:1000::/home/magar:/bin/sh`
* `usermod` - to modify user
  * To change the `/bin/sh` to `/bin/bash` we need to modify the user 
  * After that it will set to bash to the specific user `magar:x:1000:1000::/home/magar:/bin/bash`
  * To view stored password for the user in encrypted format. `cat /etc/shadow`
* `userdel` - to delete user
  * `userdel user_name`

#### Login with specific user 
* `docker exec -it -u user_name container_id bash` for example `docker exec -it -u magar 5b4dabe0ee16 bash` it will login with user magar.

#### Managing Groups 
**a. Why we need groups?**
We need group because to set the same privileges to the same group users.

**b. How to see the group info?**
The user groups information will sotred in `/etc/group`

**c. How to add the user to the group?**
There are two options -G --groups or -g --gid. Difference between --gid is for force as a primary group and --groups is as supplementary group. In Linux system for user there is one primary group and zero or more supplementary groups.
To add the user to the group `usermod -G developers magar`
**To serach the user `grep magar /etc/passwd` or `cat /etc/passwd | grep magar` It returns `magar:x:1000:1000::/home/magar:/bin/bash`**
To see the group of user `groups magar`

To see the 
1. `groupadd`
2. `groupmod`
3. `groupdel`

#### File Permission 
```Linux
-rw-r--r-- 1 root  root    11 May  5 03:58 deploy.sh
drwxr-xr-x 2 magar magar 4096 May  5 03:20 magar
```
