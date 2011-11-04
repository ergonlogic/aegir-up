Aegir-up
========

Aegir-up is a project to deploy and maintain an Aegir Hosting System
(aegirproject.org) development and testing environment that can easily be run
via Vagrant (vagrantup.com) on Virtualbox (virtualbox.org).

**N.B.** aegir-up is *NOT* intended for production hosting.


Vagrant & Virtualbox
--------------------

For those who aren't already familiar with them, Vagrant "is a tool for
building and distributing virtualized development environments"; whereas,
Virtualbox "is a general-purpose full virtualizer for x86 hardware, targeted at
server, desktop and embedded use."

Roadmap
-------

* Enable several Aegir modules:
  * DNS
  * Clone
  * Migrate
* Install several aegir contrib modules:
  * Hosting Queue Runner
  * Hosting Backup Queue
  * Backup Queue Garbage Collection
* Symlink /backups and /makefiles into /vagrant so they persist after 'vagrant
destroy's.
* Optionally install Aegir from git repos
* Automatically create one or more platforms
* Figure out an easy way to push/pull sites to/from remote Aegir servers
