#
# Module: puppet-nzbmediagrabber
#
#  Created by James Fryman on 2011-05-07.
#  Copyright (c) 2011 frymanet.com. All rights reserved.
#

class nzbmediagrabber(
        $sabnzbd       = 'true',
        $sickbeard     = 'true',
        $couchpotato   = 'true'
) {
  include stdlib
  
  anchor { 'nzbmediagrabber::begin': }
  anchor { 'nzbmediagrabber::end': }
  
  class { 'nzbmediagrabber::base': 
    require => Anchor['nzbmediagrabber::begin'], 
  }
  if $sabnzbd == 'true' {
    class { 'nzbmediagrabber::sabnzbd': 
      require => Class['nzbmediagrabber::base'],
      before  => Anchor['nzbmediagrabber::end'],
    }   
  }
  if $sickbeard == 'true' {
    class { 'nzbmediagrabber::sbeard':
      require => Class['nzbmediagrabber::base'],
      before  => Anchor['nzbmediagrabber::end'],
    }
  }
  if $couchpotato == 'true' {
    class { 'nzbmediagrabber::cpotato': 
      require => Class['nzbmediagrabber::base'],
      before  => Anchor['nzbmediagrabber::end'],
    }    
  }
}