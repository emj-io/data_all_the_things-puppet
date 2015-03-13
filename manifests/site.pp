node default {
#Prereqs
##Influxdb:
### http://influxdb.com/download/
### wget https://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
### sudo dpkg -i influxdb_latest_amd64.deb
## Riemann.io
### wget https://aphyr.com/riemann/riemann_0.2.9_all.deb
### dpkg -i wget riemann_0.2.9_all.deb
## Elasticsearch
### http://www.elastic.co/guide/en/elasticsearch/reference/current/setup-repositories.html
### wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
### sudo add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
### sudo apt-get update && sudo apt-get install elasticsearch
### sudo update-rc.d elasticsearch defaults 95 10  
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

  file { '/etc/riemann':
    source => "puppet:///modules/dataallthethings/riemann/etc/riemann",
    recurse => true,
    notify => Service['riemann']
  }

  file { '/etc/default/riemann':
    source => "puppet:///modules/dataallthethings/riemann/etc/default/riemann",
    notify => Service['riemann']
  }
}
