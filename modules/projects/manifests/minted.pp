class projects::minted {
  boxen::project { 'minted':
    source => 'minted/minted'
  }

  service { "limit.maxfiles":
    enable => true
  }

  file { '/Library/LaunchDaemons/limit.maxfiles.plist':
    content => template('projects/shared/limit.maxfiles.plist.erb'),
    notify  => Service['limit.maxfiles'],
    group   => 'wheel',
    owner   => 'root'
  }
}
