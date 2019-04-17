# Look for a manifest file and compare the gem's contents against
# that file. If they do not match, or a manifest file isn't found,
# then give the user the opportunity to bail out of installation.

Gem.pre_install do |installer|
  spec = installer.spec
  package = installer.instance_variable_get("@package")
  manifest = nil

  package.contents.each do |file|
    manifest = file if file =~ /^(manifest\.*.*?)/i
    break if manifest
  end

  if manifest
    puts "Manifest file is '#{manifest}'"
    # TODO:
    #   1 - Read file contents of manifest, ignore markup.
    #   2 - Compare package contents against manifest.
    #   3 - Give user option to bail out if contents and manifest do not match.
  else
    puts "Manifest file not found. Do you wish to continue?"

    case choice = $stdin.gets.chomp
      when /\Ay/i
      when /\An/i then next false
      else fail "cannot understand '#{choice}'"
    end
  end
end
