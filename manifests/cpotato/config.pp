class nzbmediagrabber::cpotato::config {
  anchor { 'nzbmediagrabber::cpotato::config::begin': }
  anchor { 'nzbmediagrabber::cpotato::config::end': }
  
  Class {
    require => Anchor['nzbmediagrabber::cpotato::config::begin'],
    before  => Anchor['nzbmediagrabber::cpotato::config::end'],
  }

  class { 'nzbmediagrabber::cpotato::config::common': }
  
  case $::kernel {
    'darwin': {  
      class { 'nzbmediagrabber::cpotato::config::darwin': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    'linux': {
      class { 'nzbmediagrabber::cpotato::config::linux': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    default: {
      fail('Operating System Not Supported')
    }
  }
}