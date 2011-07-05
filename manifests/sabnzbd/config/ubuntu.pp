class nzbmediagrabber::sabnzbd::config::ubuntu {
  file { '/etc/default/sabnzbdplus': 
    content => template('nzbmediagrabber/ubuntu/etc/default/sabnzbdplus.erb'),
  }
}