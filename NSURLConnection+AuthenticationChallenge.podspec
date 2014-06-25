Pod::Spec.new do |s|
  s.name             = "NSURLConnection+AuthenticationChallenge"
  s.version          = File.read('VERSION')
  s.summary          = "NSURLConnection and NSURLAuthenticationChallenge made easy!"
  s.description      = <<-DESC
                       NSURLConnection and NSURLAuthenticationChallenge with blocks.

                       Parts of the documentation has been taken from the official iOS / OS X SDK Documentation (c) Apple Inc.
                       DESC
  s.license          = 'MIT'
  s.homepage         = 'https://github.com/bulusoy/NSURLConnection-AuthenticationChallenge.git'
  s.author           = { "Bilge Taylan Ulusoy" => "bilge.ulusoy@me.com" }
  s.source           = { :git => "https://github.com/bulusoy/NSURLConnection-AuthenticationChallenge.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/bulusoy'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.public_header_files = 'Classes/*.h'
end
