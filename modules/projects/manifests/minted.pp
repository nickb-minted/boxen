class projects::minted {
  boxen::project { 'minted':
  	mysql => true,
    source => 'minted/minted'
  }
}
