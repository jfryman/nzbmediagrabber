# Class: nzbmediagrabber::sickbeard
#
#
class nzbmediagrabber::sickbeard {

        case $::operatingsystem {
                'ubuntu':  { $init_template = "nzbmediagrabber/ubuntu/etc/init.d/sickbeard.erb" }
        }

        exec { 'initial-download-sickbeard':
                command => "git clone https://github.com/midgetspy/Sick-Beard.git ${nzbmediagrabber::software_base}/sickbeard",
                path    => "/bin:/sbin:/usr/bin:/usr/sbin",
                creates => "${nzbmediagrabber::software_base}/sickbeard/SickBeard.py",
                notify  => File["${nzbmediagrabber::software_base}/sickbeard"],
        }
        file { "${nzbmediagrabber::software_base}/sickbeard":
                ensure  => directory,
                recurse => true,
        }
        file { "${nzbmediagrabber::software_base}/sickbeard/config.ini":
                content => template('nzbmediagrabber/common/sickbeard/config.ini.erb'),
                require => File["${nzbmediagrabber::software_base}/sickbeard"],
        }
        file { "/etc/init.d/sickbeard":
                owner   => 'root',
                group   => 'root',
                mode    => '0755',
                content => template($nzbmediagrabber::sickbeard::init_template),
                before  => Service['sickbeard'],
        }
        service { 'sickbeard':
                ensure    => running,
                enable    => true,
                require => File["${nzbmediagrabber::software_base}/sickbeard/config.ini"],
        }
}
