# Create a githubusername.pp
# Important: if your GitHub username has a dash "-", change it to an
# underscore in the filename and class definition!

class people::jake_minted {
  $home     = "/Users/${::boxen_user}"

  # change default shell to zsh with oh-my-zsh
  include zsh
  include ohmyzsh
  include better_touch_tools
  include emacs
  
  # osx settings - see https://github.com/boxen/puppet-osx for more
  include osx::dock::icon_size
  include osx::global::enable_keyboard_control_access
  include osx::keyboard::capslock_to_control

}
