class minted::environment {

  define add_application_to_dock() {
    include dockutil
    # We touch a file in /var/db/ when adding a dock icon, and use a custom
    # fact to check for the presence of these. This way, we avoid re-adding
    # deleted dock icons on subsequent puppet runs.
    $dockicons_created_ary = split( $dockicons_created, ',' )
    unless member( $dockicons_created_ary, $name ) {
      dockutil::item { "Add ${name}":
        item => "/Applications/${name}.app/",
        label => "${name}",
        action => "add"
      }
      file { "/var/db/.puppet_dockicon_created_${name}":
        ensure => 'present'
      }
    }
  }

  # Applications and dock icons

  include alfred
  add_application_to_dock{'Alfred 2':}

  include atom
  add_application_to_dock{'Atom':}

  include charles

  include chicken_of_the_vnc
  add_application_to_dock{'Chicken':}

  include chrome
  add_application_to_dock{'Google Chrome':}

  include clipmenu
  add_application_to_dock{'ClipMenu':}

  include crashplan

  include cyberduck
  add_application_to_dock{'CyberDuck':}

  include dash
  add_application_to_dock{'Dash':}

  include divvy
  add_application_to_dock{'Divvy':}

  include dockutil

  include dropbox

  include dterm

  include emacs
  add_application_to_dock { 'Emacs':
    notify => Exec['brew linkapps']
  }

  include firefox
  add_application_to_dock{'Firefox':}

  include flux

  include forklift
  add_application_to_dock{'Forklift':}

  include github_for_mac
  add_application_to_dock{'GitHub':}

  include gitx
  add_application_to_dock{'GitX':}

  include hipchat
  add_application_to_dock{'HipChat':}

  include induction
  add_application_to_dock{'Induction':}

  Class['iterm2::stable'] -> Class['iterm2::colors::solarized_dark']
  Class['iterm2::stable'] -> Class['iterm2::colors::solarized_light']
  include iterm2::stable
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark
  add_application_to_dock{'iTerm':}

  include java

  include jmeter

  include kindle

  include macvim
  add_application_to_dock { 'MacVim':
    notify => Exec['brew linkapps']
  }

  include nmap

  include onyx

  include open_refine

  include python

  include quicksilver
  add_application_to_dock{'QuickSilver':}

  include reggy
  add_application_to_dock{'Reggy':}

  include sequel_pro
  add_application_to_dock{'Sequel Pro':}

  include silverlight

  include skitch
  add_application_to_dock{'Skitch':}

  include skype
  add_application_to_dock{'Skype':}

  include slate
  add_application_to_dock{'Slate':}

  include sourcetree
  add_application_to_dock{'SourceTree':}

  include spotify
  add_application_to_dock{'Spotify':}

  include sublime_text
  add_application_to_dock{'Sublime Text':}

  include tmux

  include tower
  add_application_to_dock{'Tower':}

  include tunnelblick
  add_application_to_dock{'Tunnelblick':}

  include vagrant

  include virtualbox
  add_application_to_dock{'VirtualBox':}

  include vlc

  include wget

  dockutil::item { "Add Activity Monitor":
    item => '/Applications/Utilities/Activity Monitor.app/',
    label => "Activity Monitor",
    action => "add"
  }

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
