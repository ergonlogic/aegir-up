class Vm                            # default virtual machine settings
  Basebox   = "squeeze-2011-11-06"  # default basebox
  Box_url   = ""                    # URL from which to download the base box
  Gui       = 0                     # start VM with GUI? Useful for loading CD/DVD ISOs
  Memory    = 512                   # default VM memory
  Manifests = "manifests"           # puppet manifests folder name
  Modules   = "modules"             # puppet modules folder name
  Subnet    = "32"                  # 192.168.###.0/24 subnet for this network
#  Options   = "--debug --verbose"   # options to pass to Puppet
end

class Hm                            # settings for our Aegir hostmaster machine
  Shortname = "hm"                  # Vagrant name (also used for manifest name, e.g., hm.pp)
  Hostname  = "aegir.local"         # host FQDN
  Vmname    = "Aegir"               # VirtualBox name
#  Memory    = 1024                  # override the default memory
end

class Hs                            # settings for our Aegir hostslave machine(s)
  Count     = 0                     # number of hostslaves to create (will be used as a suffix to Shortname, Hostname & Vmname)
  Shortname = "hs"                  # Vagrant name (also used for manifest name, e.g., hs.pp)
  Hostname  = "cluster"             # host FQDN
  Vmname    = "Cluster"             # VirtualBox name
#  Memory    = 512                   # override the default memory
end
