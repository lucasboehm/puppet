#
# base-level operating system checks for puppet
#

class os {

	case $operatingsystem {

	    centos, debian, ubuntu: {
		    info( "OS distro for $fqdn is $operatingsystem $operatingsystemrelease ($lsbdistcodename)" )
		    include mail::newaliases
		    include "os::$operatingsystem"
		    include "os::${operatingsystem}::packages"
	    }

	    default: {
		    fail( "This puppet configuration not tested with $operatingsystem, failing host $fqdn" )
	    }

	}

}
