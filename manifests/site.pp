node default {
  package { 'clojure1.4':
    ensure => installed
  }
  package { 'puppet-el':
    ensure => installed
  }	    		    
  
}
