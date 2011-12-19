Aegir-up
========

Aegir-up deploys a local instance of the Aegir Hosting System (aegirproject.org)
atop Vagrant (vagrantup.com) and Virtualbox (virtualbox.org).

**N.B.** aegir-up is *NOT* intended for production hosting.


Installation
------------

First, ensure that you're running a relatively recent (>= 4.1.0) version of
Virtualbox, as this is required by Vagrant. You can check the version you
currently have installed by running:

    virtualbox --help

Alternatively, in the graphical front-end, you can click on the 'help' menu, and
then on "About Virtualbox..."

If these show an older version, or that Virtualbox isn't yet installed, check
the packages available for your OS (e.g., Debian backports), or download the
latest version directly from Virtualbox: https://www.virtualbox.org/wiki/Downloads

Next, make sure Vagrant is properly installed on your system. This involves
installing Ruby and RubyGems, which can be a bit tricky (especially on Windows).
Be persistent, and follow the instructions linked to from the Vagrant site:
http://vagrantup.com/docs/getting-started/index.html

Then get a local copy of the project by cloning the git repo:

    git clone http://github.com/ergonlogic/aegir-up.git

Enter the directory just created and launch the Vagrant box

    cd aegir-up
    vagrant up


Usage
-----

Once the Aegir-Up virtual machine is running, you can connet to it via SSH:

    vagrant ssh

Also, the Hostmaster front-end should be accessible via a web browser, though
you'll probably have to help it resolve to the local VM. The easiest way to do
this is to add the following to your `hosts` files (e.g., /etc/hosts on Linux
machines):

    192.168.32.10 aegir.local


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
