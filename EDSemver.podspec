Pod::Spec.new do |s|
  s.name         = "EDSemver"
  s.version      = "0.4.0"
  s.summary      = "Semantic versioning for Objective-C."
  s.homepage     = "https://github.com/thisandagain/semver"
  s.license      = "MIT"
  s.authors      = { "Andrew Sliwinski" => "andrewsliwinski@acm.org", "Sam Soffes" => "sam@soff.es", "Delisa Mason" => "delisa.mason@gmail.com" }
  s.source       = { :git => "https://github.com/thisandagain/semver.git", :tag => "v0.4.0" }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.8'
  s.tvos.deployment_target = '9.0'
  s.source_files = 'EDSemver'
  s.requires_arc = true
end
