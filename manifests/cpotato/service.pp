class nzbmediagrabber::cpotato::service {
  service { 'couchpotato':
		ensure    => running,
		hasstatus => true,
	}
}