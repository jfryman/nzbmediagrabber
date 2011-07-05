class nzbmediagrabber::couchpotato {
  anchor { 'nzbmediagrabber::couchpotato::begin': }
  
  class { 'nzbmediagrabber::couchpotato::package': 
    require => Anchor['nzbmediagrabber::couchpotato::begin'],
  }
  
  class { 'nzbmediagrabber::couchpotato::config':  
    require => Class['nzbmediagrabber::couchpotato::package'],
  }
  
  class { 'nzbmediagrabber::couchpotato::service': 
    subscribe => Class['nzbmediagrabber::couchpotato::service'],
  }
  
  anchor { 'nzbmediagrabber::couchpotato::end':   
    require => Class['nzbmediagrabber::couchpotato::service'],
  }
}