class nzbmediagrabber::couchpotato::service {
  service { 'couchpotato':
		ensure  => running,
		enable  => true,
	}
}