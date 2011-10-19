class Vm                          # default virtual machine settings
  Basebox = "squeeze-2011-09-29"  # default basebox
  Gui = 0                         # start VM with GUI? Useful for loading CD/DVD ISOs
  Memory = 512                    # default VM memory
  Manifests = "manifests"         # puppet manifests folder name
  Base = "base.pp"                # default puppet manifest
  Subnet = "32"                   # 192.168.###.0/24 subnet for this network
end

class Hm                          # settings for our Aegir hostmaster machine
  Shortname = "hm"                # Vagrant name 
  Hostname = "aegir.local"        # host FQDN
  Vmname = "Aegir"                # VirtualBox name
#  Memory = 1024                   # override the default memory
end

class Hs                          # settings for our Aegir hostslave machine(s)
  Count = 0                       # number of hostslaves to create
  Shortname = "hs"                # Vagrant name (suffixed w/Count)
  Hostname = "cluster"            # host FQDN (suffixed w/Count)
  Vmname = "Cluster"              # VirtualBox name (suffixed w/Count)
#  Memory = 512                    # override the defaul memory
end
