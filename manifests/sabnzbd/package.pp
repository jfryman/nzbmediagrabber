class nzbmediagrabber::sabnzbd::package {
  anchor { 'nzbmediagrabber::sabnzbd::package::begin': }
  anchor { 'nzbmediagrabber::sabnzbd::package::end': }
  
  Class {
    require => Anchor['nzbmediagrabber::sabnzbd::package::begin'],
    before  => Anchor['nzbmediagrabber::sabnzbd::package::end'],
  }
  
  case $operatingsystem {
    ubuntu: {
      class { 'nzbmediagrabber::sabnzbd::package::ubuntu': }
    }
  }
}