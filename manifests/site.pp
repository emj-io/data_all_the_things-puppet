node default {
#Prereqs
##Influxdb:
### http://influxdb.com/download/
### wget https://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
### sudo dpkg -i influxdb_latest_amd64.deb
## Riemann.io
### wget https://aphyr.com/riemann/riemann_0.2.9_all.deb
### dpkg -i wget riemann_0.2.9_all.deb
  
  package { 'clojure1.4':
    ensure => installed
  }
 
  package { 'puppet-el':
    ensure => installed
  }	    		    
  package { ['collectd', 'collectd-utils' ]:
    ensure => installed
  }

  service { 'collectd':
    ensure => running,
    enable => true
  }

  file { '/etc/collectd':
    source => "puppet:///modules/dataallthethings/collectd/",
    recurse => true,
    notify => Service['collectd']
  }
  
  service { 'riemann':
    ensure => running,
    enable => true
  }
}
