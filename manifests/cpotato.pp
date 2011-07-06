class nzbmediagrabber::cpotato {
  anchor { 'nzbmediagrabber::cpotato::begin': 
    before => Class['nzbmediagrabber::cpotato::package'],
  }
  
  class { 'nzbmediagrabber::cpotato::package': 
    notify  => Class['nzbmediagrabber::cpotato::service'],
  }
  
  class { 'nzbmediagrabber::cpotato::config':  
    require => Class['nzbmediagrabber::cpotato::package'],
    notify  => Class['nzbmediagrabber::cpotato::service'],
  }
  
  class { 'nzbmediagrabber::cpotato::service': }
  
  anchor { 'nzbmediagrabber::cpotato::end':   
    require => Class['nzbmediagrabber::cpotato::service'],
  }
}