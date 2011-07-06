class nzbmediagrabber::sbeard {
  anchor { 'nzbmediagrabber::sbeard::begin': 
    before => Class['nzbmediagrabber::sbeard::package'],
  }
  
  class { 'nzbmediagrabber::sbeard::package': 
    notify  => Class['nzbmediagrabber::sbeard::service'],
  }
  
  class { 'nzbmediagrabber::sbeard::config':  
    require => Class['nzbmediagrabber::sbeard::package'],
    notify  => Class['nzbmediagrabber::sbeard::service'],
  }
  
  class { 'nzbmediagrabber::sbeard::service': }
  
  anchor { 'nzbmediagrabber::sbeard::end':   
    require => Class['nzbmediagrabber::sbeard::service'],
  }
}