class nzbmediagrabber::sabnzbd {
  anchor { 'nzbmediagrabber::sabnzbd::begin': }
  
  class { 'nzbmediagrabber::sabnzbd::package': 
    require => Anchor['nzbmediagrabber::sabnzbd::begin'],
  }
  
  class { 'nzbmediagrabber::sabnzbd::config':  
    require => Class['nzbmediagrabber::sabnzbd::package'],
  }
  
  class { 'nzbmediagrabber::sabnzbd::service': 
    subscribe => Class['nzbmediagrabber::sabnzbd::service'],
  }
  
  anchor { 'nzbmediagrabber::sabnzbd::end':   
    require => Class['nzbmediagrabber::sabnzbd::service'],
  }
}