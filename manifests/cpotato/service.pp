class nzbmediagrabber::cpotato::service {
  service { 'couchpotato':
		ensure     => running,
		enable     => true,
		hasstatus  => true,
		hasrestart => true,
	}
}