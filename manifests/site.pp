node default {
#Prereqs
##Influxdb:
### http://influxdb.com/download/
### wget https://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
### sudo dpkg -i influxdb_latest_amd64.deb
  
  package { 'clojure1.4':
    ensure => installed
  }
  package { 'puppet-el':
    ensure => installed
  }	    		    
}
