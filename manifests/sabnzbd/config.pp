class nzbmediagrabber::sabnzbd::config {
  anchor { 'nzbmediagrabber::sabnzbd::config::begin': }
  anchor { 'nzbmediagrabber::sabnzbd::config::end': }
  
  Class {
    require => Anchor['nzbmediagrabber::sabnzbd::config::begin'],
    before  => Anchor['nzbmediagrabber::sabnzbd::config::end'],
  }
  
  class { 'nzbmediagrabber::sabnzbd::config::common': } 
  
  case $operatingsystem {
    'ubuntu': { 
      class {'nzbmediagrabber::sabnzbd::config::ubuntu': }
    }
  }
}