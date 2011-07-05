class nzbmediagrabber::sabnzbd::darwin {
    file { "${nzbmediagrabber::software_base}/sabnzbd":
        ensure => directory,
    }
	file { "${nzbmediagrabber::home_dir}/Library/Application Support/SABnzbd":
		ensure => directory,
		owner  => $nzbmediagrabber::user_id,
		group  => $nzbmediagrabber::group,
	}
	file { "${nzbmediagrabber::home_dir}/Library/Application Support/SABnzbd/sabnzbd.ini":
	    content => template('nzbmediagrabber/common/sabnzbd/config.ini.erb'),
	}
	exec { 'download-sabnzbd-source':
		command => "curl -L http://sourceforge.net/projects/sabnzbdplus/files/sabnzbdplus/sabnzbd-${nzbmediagrabber::sabnzbd_version}/SABnzbd-${nzbmediagrabber::sabnzbd_version}-src.tar.gz/download > /tmp/sabnzbd.tar.gz",
		path	=> '/bin:/usr/bin:/sbin:/usr/sbin',
		creates	=> "/tmp/sabnzbd.tar.gz",
		before  => Exec['extract-sabnzbd'],
	}

	exec { 'extract-sabnzbd':
		command => "tar zxf /tmp/sabnzbd.tar.gz -C ${nzbmediagrabber::software_base}/",
		path	=> '/bin:/usr/bin:/sbin:/usr/sbin',
		creates	=> "${nzbmediagrabber::software_base}/SABnzbd-${nzbmediagrabber::sabnzbd_version}/SABnzbd.py",
	}
	
	file { '/Library/LaunchDaemons/com.nzbmediagrabber.sabnzbd':
		ensure  => file,
		owner   => 'root',
		group   => 'wheel',
		content => template('nzbmediagrabber/darwin/Library/LaunchDaemons/com.nzbmediagrabber.sabnzbd.erb'),
	}
}