class nzbmediagrabber::base {
  
  anchor { 'nzbmediagrabber::base::begin': }
  anchor { 'nzbmediagrabber::base::end': }
  
  Class {
    require => Anchor['nzbmediagrabber::base::begin'],
    before  => Anchor['nzbmediagrabber::base::end'],
  }

  class { 'nzbmediagrabber::base::common': }
  
  case $::kernel {
    'darwin': {  
      class { 'nzbmediagrabber::base::darwin': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    'linux': {
      class { 'nzbmediagrabber::base::linux': 
        require => Class['nzbmediagrabber::base::common'],
      }
    }
    default: {
      fail('Operating System Not Supported')
    }
  }
}