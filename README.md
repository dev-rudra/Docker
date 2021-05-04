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

## Containers
Contaier give us same kind of isolation so
* Allow running multiple apps in isolation - But they are
* more light weight - they don't need a full operating system.
* Infact all containers on a single machine shared a operating system of the host (Use OS of the host) so that means we need to license, patch and monitor a single operating system. Also because the operating system already started on the host
* A Container can start-up prety quickly usally in a second sometimes less and also the container don't need slice of hardware resources on the host.
* Need less hardware resources.

