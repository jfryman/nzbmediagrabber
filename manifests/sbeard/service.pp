class nzbmediagrabber::sbeard::service {
  service { 'sickbeard':
	  ensure    => running,
	  hasstatus => true,
	}
}