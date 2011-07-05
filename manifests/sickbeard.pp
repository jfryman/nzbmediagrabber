class nzbmediagrabber::sickbeard {
  anchor { 'nzbmediagrabber::sickbeard::begin': }
  
  class { 'nzbmediagrabber::sickbeard::package': 
    require => Anchor['nzbmediagrabber::sickbeard::begin'],
  }
  
  class { 'nzbmediagrabber::sickbeard::config':  
    require => Class['nzbmediagrabber::sickbeard::package'],
  }
  
  class { 'nzbmediagrabber::sickbeard::service': 
    subscribe => Class['nzbmediagrabber::sickbeard::service'],
  }
  
  anchor { 'nzbmediagrabber::sickbeard::end':   
    require => Class['nzbmediagrabber::sickbeard::service'],
  }
}