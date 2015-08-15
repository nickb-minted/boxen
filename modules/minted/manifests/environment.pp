class minted::environment {

  define install_application($dockicon = false) {
    include $name
    if ($dockicon) {
      include dockutil
      # We touch a file in /var/db/ when adding a dock icon, and use a custom
      # fact to check for the presence of these. This way, we avoid re-adding
      # deleted dock icons on subsequent puppet runs.
      $dockicons_created_ary = split( $dockicons_created, ',' )
      unless member( $dockicons_created_ary, $dockicon ) {
        dockutil::item { "Add ${dockicon}":
          item => "/Applications/${dockicon}.app/",
          label => "${dockicon}",
          action => "add",
          require => Class[$name],
        } ->
        file { "/var/db/.puppet_dockicon_created_${dockicon}":
          ensure => 'present',
        }
      }
    }
  }

  # Applications and dock icons

  install_application{'alfred':}
  install_application{'chrome::beta': dockicon => 'Google Chrome'}
  install_application{'chrome::canary': dockicon => 'Google Chrome Canary'}
  install_application{'clipmenu':}
  install_application{'dash':}
  install_application{'divvy':}
  install_application{'dockutil':}
  install_application{'dropbox':}
  install_application{'dterm':}
  install_application{'firefox': dockicon => 'Firefox'}
  install_application{'flux':}
  install_application{'forklift':}
  install_application{'gitx':}
  install_application{'hipchat': dockicon => 'HipChat'}
  install_application{'iterm2::stable': dockicon => 'iTerm'}
  install_application{'java':}
  install_application{'jmeter':}
  install_application{'macvim': notify => Exec['brew linkapps'] }
  install_application{'nmap':}
  install_application{'sequel_pro':}
  install_application{'silverlight':}
  install_application{'skitch':}
  install_application{'slate':}
  install_application{'sourcetree':}
  install_application{'sublime_text':}
  install_application{'tmux':}
  install_application{'tower':}
  install_application{'vagrant':}
  install_application{'vmware_fusion':}
  install_application{'vlc':}
  install_application{'wget':}

  Class['iterm2::stable'] -> Class['iterm2::colors::solarized_dark']
  Class['iterm2::stable'] -> Class['iterm2::colors::solarized_light']
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark

  # Symlink homebrew installed cocoa apps into /Applications
  exec { 'brew linkapps':
    refreshonly => true,
    require => Class['homebrew::repo']
  }

  # SublimeText modules
  # sublime text packages and themes
  sublime_text::package { 'Package Control':
    source => 'wbond/sublime_package_control'
  }

  sublime_text::package { 'CloudFormation':
   source => 'minted/cloud-formation-sublime-snippets'
  }

  sublime_text::package { 'puppet syntax':
    source => 'eklein/sublime-text-puppet'
  }

  sublime_text::package { 'SublimeLinter-pep8':
    source => 'SublimeLinter/SublimeLinter-pep8'
  }

  sublime_text::package { 'SublimeLinter-jshint':
    source => 'SublimeLinter/SublimeLinter-jshint'
  }

  sublime_text::package { 'SublimeLinter-pylint':
    source => 'SublimeLinter/SublimeLinter-pylint'
  }

  sublime_text::package { 'SublimeAutoPEP8':
    source => 'wistful/SublimeAutoPEP8'
  }

  sublime_text::package { 'ApacheConf':
    source => 'colinta/ApacheConf.tmLanguage'
  }

  sublime_text::package { 'SublimeBlockCursor':
    source => 'netpro2k/SublimeBlockCursor'
  }

  sublime_text::package { 'SublimePrettyJson':
    source => 'dzhibas/SublimePrettyJson'
  }

  sublime_text::package { 'Surround':
    source => 'jcartledge/sublime-surround'
  }

  # can we do this???
  # vagrant::plugin { 'vagrant-vmware-fusion':
  #   license => 'puppet:///modules/minted/licenses/fusion.lic',
  # }

  # Projects
  include projects::puppet
  include projects::minted

}
