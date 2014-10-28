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

  install_application{'alfred': dockicon => 'Alfred 2'}
  install_application{'atom': dockicon => 'Atom'}
  install_application{'charles':}
  install_application{'chicken_of_the_vnc': dockicon => 'Chicken'}
  install_application{'chrome': dockicon => 'Google Chrome'}
  install_application{'clipmenu': dockicon => 'ClipMenu'}
  install_application{'crashplan':}
  install_application{'dash': dockicon => 'Dash'}
  install_application{'divvy': dockicon => 'Divvy'}
  install_application{'dockutil':}
  install_application{'dropbox':}
  install_application{'dterm':}
  install_application{'emacs': dockicon => 'Emacs', notify => Exec['brew linkapps'] }
  install_application{'firefox': dockicon => 'Firefox'}
  install_application{'flux':}
  install_application{'forklift': dockicon => 'Forklift'}
  install_application{'github_for_mac': dockicon => 'GitHub'}
  install_application{'gitx': dockicon => 'GitX'}
  install_application{'hipchat': dockicon => 'HipChat'}
  install_application{'induction': dockicon => 'Induction'}
  install_application{'iterm2::stable': dockicon => 'iTerm'}
  install_application{'java':}
  install_application{'jmeter':}
  install_application{'macvim': dockicon =>'MacVim', notify => Exec['brew linkapps'] }
  install_application{'nmap':}
  install_application{'onyx':}
  install_application{'open_refine':}
  install_application{'quicksilver': dockicon => 'QuickSilver'}
  install_application{'reggy': dockicon => 'Reggy'}
  install_application{'sequel_pro': dockicon => 'Sequel Pro'}
  install_application{'silverlight':}
  install_application{'skitch': dockicon => 'Skitch'}
  install_application{'skype': dockicon => 'Skype'}
  install_application{'slate': dockicon => 'Slate'}
  install_application{'sourcetree': dockicon => 'SourceTree'}
  install_application{'sublime_text': dockicon => 'Sublime Text'}
  install_application{'tmux':}
  install_application{'tower': dockicon => 'Tower'}
  install_application{'tunnelblick': dockicon => 'Tunnelblick'}
  install_application{'vagrant':}
  install_application{'virtualbox': dockicon => 'VirtualBox'}
  install_application{'vlc':}
  install_application{'wget':}

  dockutil::item { "Add Activity Monitor":
    item => '/Applications/Utilities/Activity Monitor.app/',
    label => "Activity Monitor",
    action => "add"
  }

  Class['iterm2::stable'] -> Class['iterm2::colors::solarized_dark']
  Class['iterm2::stable'] -> Class['iterm2::colors::solarized_light']
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark

  # Symlink homebrew installed cocoa apps into /Applications
  exec { 'brew linkapps':
    refreshonly => true,
    require => Class['homebrew::repo']
  }

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

  # osx settings
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::disable_autocorrect
  include osx::dock::dim_hidden_apps
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_hard_drives_on_desktop
  include osx::finder::show_mounted_servers_on_desktop
  include osx::finder::show_removable_media_on_desktop
  include osx::finder::unhide_library
  include osx::finder::enable_quicklook_text_selection
  include osx::universal_access::ctrl_mod_zoom
  include osx::no_network_dsstores
  include osx::keyboard::capslock_to_control
  include osx::mouse::smart_zoom
  include osx::mouse::swipe_between_pages
  class { 'osx::global::key_repeat_delay': delay => 10 }
  class { 'osx::global::key_repeat_rate': rate => 2 }
  class { 'osx::global::natural_mouse_scrolling': enabled => false }
  class { 'osx::universal_access::cursor_size': zoom => 1 }
  class { 'osx::dock::icon_size': size => 20 }

  # Projects
  include projects::puppet
  # include projects::minted # some day.. :'(

}
