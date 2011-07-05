class nzbmediagrabber::couchpotato::config {
  anchor { 'nzbmediagrabber::couchpotato::config::begin': }
  anchor { 'nzbmediagrabber::couchpotato::config::end': }
  
  Class {
    require => Anchor['nzbmediagrabber::couchpotato::config::begin'],
    before  => Anchor['nzbmediagrabber::couchpotato::config::end'],
  }

  class { 'nzbmediagrabber::couchpotato::config::common': }
  
  case $::kernel {
    'darwin': {  
      class { 'nzbmediagrabber::couchpotato::config::darwin': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    'linux': {
      class { 'nzbmediagrabber::couchpotato::config::linux': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    default: {
      fail('Operating System Not Supported')
    }
  }
}