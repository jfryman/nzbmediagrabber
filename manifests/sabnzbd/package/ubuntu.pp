class nzbmediagrabber::sabnzbd::package::ubuntu {
  $sabnzbd_ubuntu = ['python-cheetah', 'unrar', 'javascript-common',
                        'libjs-excanvas', 'libjs-mochikit', 'libtidy-0.99-0',
                        'par2', 'python-chardet', 'python-configobj', 
                        'python-feedparser', 'python-utidylib', 'python-yenc',
                        'sabnzbdplus', 'sabnzbdplus-theme-classic', 
                        'sabnzbdplus-theme-plush', 'sabnzbdplus-theme-smpl',
                        'wwwconfig-common'] 
                        
	package { $sabnzbd_ubuntu:
		ensure => present,
	}
}