Over the years, I have written dozens of Ansible roles. They were often written and rewritten quickly and did the job they were supposed to do. I probably won't include many of them in this collection.

But now, it is not enough to simply write such roles myself. I need to adapt to the requirement of doing more sophisticated work within limited time. So, I decided to use an AI agent to write Ansible roles and playbooks for me. Some of them will also be included here.

- ipaccess: imho, still needs heavy refactoring, but let it be as it is for now
- incus-container: create an LXC container from the local: image, give it a static IP address via netplan inside the container; optionally, use a single volume, for /var/lib/mysql, as an example
- mysql-exporter: Install and run as a service mysql-exporter for Prometheus in order to collect MySQL metrics from the remote system
- selinux-booleans: hard-coded set of booleans for the web server. TODO: may be they do not need to be hard-coded
- swappiness: the simple role to change sysctl vm.swappiness
- systemd-resolved: change the preferred DNS servers for a cloud-init system. TODO: verify it on the default Debian/Ubuntu installation
- to be continued
