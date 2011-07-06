class nzbmediagrabber::params {
  $nr_software_base = '/usr/local/mediagrabber'
  $nr_media_base    = '/opt/media'
  $nr_user_id       = 'mediagrabber'
  $nr_scratch_base  = '/opt/media/scratch'
  
  $nr_home_dir = $kernel ? {
		'darwin' => "/Users/${nr_user_id}",
		default  => "/home/${nr_user_id}",
	}
	
	$nr_sabnzbd_daemon = $operatingsystem ? {
	  /(?i-mx:ubuntu)/ => 'sabnzbdplus',
	}
  
  $nr_sabnzbd_version = '0.6.0'
}