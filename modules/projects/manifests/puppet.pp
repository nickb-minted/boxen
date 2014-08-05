class projects::puppet {
  boxen::project { 'puppet':
    ruby => '2.0.0',
    source => 'minted/puppet'
  }
}