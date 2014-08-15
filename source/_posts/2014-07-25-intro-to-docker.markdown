---
layout: post
title: "Intro to Docker"
date: 2014-07-25 12:49
comments: true
categories: docker
---

### Docker API
  - [Checkout](https://github.com/swipely/docker-api)

### Relevant Docker Images
  - [dokku](https://github.com/progrium/dokku)

### Pups
  - [pups](https://github.com/samsaffron/pups) is a small library that allows you to automate the process of creating Unix images

### Deployments
  - [Core OS](https://coreos.com/)

### Discourse on docker
  - [Sam Saffron explains](http://samsaffron.com/archive/2013/11/07/discourse-in-a-docker-container)

### haproxy
  - [High Performance Load Balancer](http://www.haproxy.org/)

### Testing
  - testing docker seems tough. Puppet Labs [gave it a run](https://github.com/puppetlabs/beaker/blob/master/spec/beaker/hypervisor/docker_spec.rb).

### Intro video
  - [Founder of Docker Inc](https://www.youtube.com/watch?v=Q5POuMHxW-0)

### Commands

```
docker run -p 3000:3000 -t -i dockerregistry.flatironschool.com/ironboard /bin/bash
source /etc/profile.d/rvm.sh 
rvm reload
vi ironboard/config/database.yml
cd ironboard/
service postgresql start
rake db:migrate

docker build -t dockerregistry.flatironschool.com/ironboard .
docker run -d -p 3000:3000 dockerregistry.flatironschool.com/ironboard
```

### Notes from [Docker: The Revolution Will Be Containerized](http://vimeo.com/95932458)
  - Containers are just other Linux processes on the host not virtualized calls
  - The only performance decrease you see is Linux asking whether it is allowed to access this file - share a kernel with the host
  - Not nested virtualization
    - this would be slow
    - no device emulation, which makes it faster

  - Can be used as a light weight vm but that's not the only way

  - **`Chroot` on steroids?**
    - (From [Wikipedia](http://en.wikipedia.org/wiki/Chroot)) A `chroot` on Unix operating systems is an operation that changes the apparent root directory for the current running process and its children.

    - A chroot environment can be used to create and host a separate virtualized copy of the software system. This can be useful for:
      - **Testing and development**
        - A test environment can be set up in the chroot for software that would otherwise be too risky to deploy on a production system.

      - **Dependency control**
        - Software can be developed, built and tested in a chroot populated only with its expected dependencies. This can prevent some kinds of linkage skew that can result from developers building projects with different sets of program libraries installed.

      - **Compatibility**
        - Legacy software or software using a different [application binary interface](http://en.wikipedia.org/wiki/Application_binary_interface) must sometimes be run in a chroot because their supporting libraries or data files may otherwise clash in name or linkage with those of the host system.

      - **Recovery**
          - Should a system be rendered unbootable, a chroot can be used to move back into the damaged environment after bootstrapping from an alternate root file system (such as from installation media, or a Live CD).

      - **Privilege separation**
        - Programs are allowed to carry open file descriptors (for files, pipelines and network connections) into the chroot, which can simplify jail design by making it unnecessary to leave working files inside the chroot directory. This also simplifies the common arrangement of running the potentially vulnerable parts of a privileged program in a sandbox, in order to pre-emptively contain a security breach. Note that chroot is not necessarily enough to contain a process with root privileges.

  - **Cgroups**
    - [Cgroups](http://en.wikipedia.org/wiki/Cgroups))is a Linux kernel feature to limit, account, and isolate resource usage (CPU, memory, disk I/O, etc.) of process groups.
    - Cgroups also provides namespace isolation to completely isolate application's view of the operating environment, including process trees, network, user ids and mounted file systems.

  - **LXC (LinuX Containers)**
    - [LXC](http://en.wikipedia.org/wiki/LXC) provides operating system-level virtualization through a virtual environment that has its own process and network space, instead of creating a full-fledged virtual machine.
    - The Linux kernel comprises cgroups for resource isolation (CPU, memory, block I/O, network, etc.) that does not require starting any virtual machines.
    - LXC combines cgroups and namespace support to provide an isolated environment for applications. Docker can also use LXC as one of its execution drivers, enabling image management and providing deployment services.

  - **CoreOS**
    - [CoreOS](http://en.wikipedia.org/wiki/CoreOS) is an open source lightweight operating system based on the Linux kernel and designed for providing infrastructure to clustered deployments, while focusing on automation, ease of applications deployment, security, reliability and scalability. As an operating system, CoreOS provides only the minimal functionality required for deploying applications inside software containers, together with built-in mechanisms for service discovery and configuration sharing.

### Linking Multiple Apps
  - 
