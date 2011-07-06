class nzbmediagrabber::sabnzbd::config::ubuntu {
  file { '/etc/default/sabnzbdplus': 
    content => template('nzbmediagrabber/sabnzbd/etc/default/sabnzbdplus.erb'),
  }
}