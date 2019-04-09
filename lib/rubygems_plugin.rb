# Look for a manifest file and compare the gem's contents against
# that file. If they do not match, or a manifest file isn't found,
# then give the user the opportunity to bail out of installation.

Gem.pre_install do |installer|
  spec = installer.spec
  manifest = nil

  spec.files.each do |file|
    manifest = file if file =~ /^(manifest\.*.*?)/i
    break if manifest
  end

  if manifest
    puts "Manifest file is: #{manifest}."
  else
    puts "Manifest file not found."
  end
end
