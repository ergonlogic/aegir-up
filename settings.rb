class Vm   # Default virtual machine settings
  Basebox = "squeeze-2011-09-29"
  Gui = 0
  Memory = 512
  Manifests = "manifests"
  Base = "base.pp"
end

class Hm   # Settings for our Aegir hostmaster machine
  Count = 1  # Number of hostmasters to create
  Shortname = "hm"
  Hostname = "aegir.local"
  Vmname = "Aegir"
#  Memory = 1024  # Uncomment this line to override the defaul memory
end

class Hs   # Settings for our Aegir hostslave machine(s)
  Count = 0  # Number of hostslaves to create
  Shortname = "hs"
  Hostname = "cluster"
  Vmname = "Cluster"
#  Memory = 512   # Uncomment this line to override the defaul memory
end
