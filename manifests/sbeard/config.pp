class nzbmediagrabber::sbeard::config {
  anchor { 'nzbmediagrabber::sbeard::config::begin': }
  anchor { 'nzbmediagrabber::sbeard::config::end': }
  
  Class {
    require => Anchor['nzbmediagrabber::sbeard::config::begin'],
    before  => Anchor['nzbmediagrabber::sbeard::config::end'],
  }

  class { 'nzbmediagrabber::sbeard::config::common': }
  
  case $::kernel {
    'darwin': {  
      class { 'nzbmediagrabber::sbeard::config::darwin': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    'linux': {
      class { 'nzbmediagrabber::sbeard::config::linux': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    default: {
      fail('Operating System Not Supported')
    }
  }
}