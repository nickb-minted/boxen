#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.1"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.4"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.2"
github "git",         "2.7.91"
github "go",          "2.1.0"
github "homebrew",    "1.13.0"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.4"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "stdlib",      "4.4.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github 'alfred',      '1.5.0'
github 'atom',        '1.1.0'
github 'better_touch_tools', '3.0.0'
github 'charles',     '1.0.4'
github 'chicken_of_the_vnc', '0.1.2'
github 'chrome',      '1.2.0'
github 'clipmenu',    '1.0.0'
github 'dash',        '1.0.0'
github 'divvy',       '1.0.1'
github 'dockutil',    '0.2.1'
github 'dropbox',     '1.4.1'
github 'dterm',       '1.0.2'
github 'emacs',       '1.3.0'
github 'firefox',     '1.2.3'
github 'flux',        '1.0.1'
github 'forklift',    '1.0.8'
github 'github_for_mac', '1.0.3'
github 'gitx',        '1.2.0'
github 'hipchat',     '1.1.3'
# this module is borken
#github 'induction',   '1.0.0'
github 'iterm2',      '1.2.2'
# 2.0 is almost out and will install java 1.8
github 'java',        '1.8.3'
github 'jmeter',      '0.1.5'
github 'macvim',      '1.0.0'
github 'mysql',       '1.99.9'
github 'nmap',        '1.0.3'
github 'onyx',        '1.2.0'
github 'open_refine', '1.0.0'
github 'osx',         '2.8.0'
github 'property_list_key', '0.1.0'
github 'quicksilver', '1.3.0'
github 'reggy',       '1.0.2'
github 'sequel_pro',  '1.0.1'
github 'silverlight', '1.0.1'
github 'skitch',      '1.0.3'
github 'skype',       '1.0.9'
github 'slate',       '1.0.1'
github 'sourcetree',  '1.0.0'
github 'spotify',     '1.0.2'
github 'sublime_text','1.0.2'
github 'tmux',        '1.0.2'
github 'tower',       '1.0.0'
github 'tunnelblick', '1.0.7'
github 'vagrant',     '3.2.0'
github 'virtualbox',  '1.0.13'
github 'vlc',         '1.1.0'
github 'wget',        '1.0.1'
github 'zsh',         '1.0.0'
github 'ohmyzsh',     '1.0.0', :repo => 'erivello/puppet-ohmyzsh'
github 'bartender',   '1.0.0'
github 'vmware_fusion', '1.2.0'


# TODO: fix and install: authy, viscoscity.
