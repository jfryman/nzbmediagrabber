class nzbmediagrabber::sickbeard::config {
  anchor { 'nzbmediagrabber::sickbeard::config::begin': }
  anchor { 'nzbmediagrabber::sickbeard::config::end': }
  
  Class {
    require => Anchor['nzbmediagrabber::sickbeard::config::begin'],
    before  => Anchor['nzbmediagrabber::sickbeard::config::end'],
  }

  class { 'nzbmediagrabber::sickbeard::config::common': }
  
  case $::kernel {
    'darwin': {  
      class { 'nzbmediagrabber::sickbeard::config::darwin': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    'linux': {
      class { 'nzbmediagrabber::sickbeard::config::linux': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    default: {
      fail('Operating System Not Supported')
    }
  }
}