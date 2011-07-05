class nzbmediagrabber::sickbeard::service {
  service { 'sickbeard':
		ensure  => running,
		enable  => true,
	}
}