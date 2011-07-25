Gem::Specification.new do |s|
  s.name = "country_tools"
  s.summary = "Country tools for Rails"
  s.description = "Country tools for Rails"
  s.homepage = "http://github.com/aurels/country_tools"
  
  s.version = "0.1"
  s.date = "2011-07-25"
  
  s.authors = ["Aurélien Malisart"]
  s.email = "aurelien.malisart@gmail.com"
  
  s.require_paths = ["lib"]
  s.files = Dir["lib/**/*"] + ["README.rdoc", "Rakefile", "names.yml", "MIT-LICENSE"]
  s.extra_rdoc_files = ["README.rdoc"]
  
  s.has_rdoc = false

  s.rubygems_version = "1.3.4"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6")
end