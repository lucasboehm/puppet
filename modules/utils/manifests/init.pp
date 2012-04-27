#
# Some basic utilities
#
# This is an icky class - it should be removed
#

class utils {
	if ($operatingsystem == "CentOS") {

		yumrepo { "epel":
			enabled		=> 1,
			includepkgs	=> absent,
			excludepkgs	=> 'clam*',
			require		=> Package["epel-release"],
		}

		package { "epel-release":
			ensure		=> installed,
		}

		yumrepo { "rpmforge":
			enabled		=> 1,
			includepkgs	=> 'rpmforge-release,clam*,git*,graphviz,ifplugd,memtester*,perl-*,rrdtool*,sarg*',
			require		=> Package["rpmforge-release"],
		}

		package { "rpmforge-release":
			ensure		=> installed,
		}

	}

	# utility scripts
	$files = [
		'check-reboot-required',
		'fix-tun-devices',
		'randomsleep',
		'upgrade-dansguardian',
	]
	ulb { $files: source_class => utils }

}

