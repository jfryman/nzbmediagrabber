class nzbmediagrabber::sabnzbd {
  anchor { 'nzbmediagrabber::sabnzbd::begin': 
    before => Class['nzbmediagrabber::sabnzbd::package']
  }
  
  class { 'nzbmediagrabber::sabnzbd::package': 
    notify  => Class['nzbmediagrabber::sabnzbd::service'],
  }
  
  class { 'nzbmediagrabber::sabnzbd::config':  
    require => Class['nzbmediagrabber::sabnzbd::package'],
    notify  => Class['nzbmediagrabber::sabnzbd::service'],
  }
  
  class { 'nzbmediagrabber::sabnzbd::service': }
  
  anchor { 'nzbmediagrabber::sabnzbd::end':   
    require => Class['nzbmediagrabber::sabnzbd::service'],
  }
}