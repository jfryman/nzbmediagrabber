class nzbmediagrabber::sbeard::service {
  service { 'sickbeard':
		ensure     => running,
		enable     => true,
		hasstatus  => true,
		hasrestart => true,
	}
}