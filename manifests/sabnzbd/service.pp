class nzbmediagrabber::sabnzbd::service {
  service { "${nzbmediagrabber::params::nr_sabnzbd_daemon}":
    enable     => true,
    ensure     => running,
  }
}