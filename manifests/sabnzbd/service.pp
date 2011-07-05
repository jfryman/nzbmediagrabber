class nzbmediagrabber::sabnzbd::service {
  service { "${nzbmediagrabber::params::nr_sickbeard_daemon}":
    enable    => true,
    ensure    => running,
    hasstatus => true,
  }
}