# -*- ruby -*-

require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
require 'lib/cloudsponge'

PKG_FILES = FileList["**/*"].exclude(/CVS|pkg|tmp|coverage|Makefile|\.nfs\./)

spec = Gem::Specification.new do |s|
  s.name = 'cloudsponge'
  s.version = Cloudsponge::VERSION
  s.author = "Graeme Rouse"
  s.email = "graeme@cloudsponge.com"
  s.homepage = "http://www.cloudsponge.com"
  s.platform  = Gem::Platform::RUBY
  s.summary = "A library wrapper for Cloudsponge.com's API"
  s.description = <<-EOF
    Usage:
      contacts = nil
      importer = Cloudsponge::ContactImporter.new(DOMAIN_KEY, DOMAIN_PASSWORD)
      importer.begin_import('YAHOO')
      loop do
        events = importer.get_events
        break unless events.select{ |e| e.is_error? }.empty?
        unless events.select{ |e| e.is_completed? }.empty?
          contacts = importer.get_contacts
          break
        end
      end
  EOF
  
  #s.files = FileList["{test,lib}/**/*"].exclude("rdoc").to_a
  s.files = PKG_FILES
#  s.files = PKG_FILES
  s.require_path = "lib"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "HISTORY", "TODO"]
end


Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end