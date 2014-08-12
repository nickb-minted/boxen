Facter.add(:dockicons_created) do
  setcode do
    Dir.glob('/var/db/.puppet_dockicon_created_*').collect{|f| f =~ /^.*puppet_dockicon_created_(.*)$/; $1 }.join(',')
  end
end
