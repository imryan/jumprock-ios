Pod::Spec.new do |s|
  s.name             = 'Jumprock'
  s.version          = '1.0.2'
  s.summary          = 'Send static forms via the Jumprock API.'

  s.description      = <<-DESC
Send static forms via Jumprock's API.
                       DESC

  s.homepage         = 'https://github.com/imryan/jumprock-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ryan Cohen' => 'notryancohen@gmail.com' }
  s.source           = { :git => 'https://github.com/imryan/jumprock-ios.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/notryancohen'
  s.ios.deployment_target = '8.0'
  s.source_files = 'Jumprock/Classes/**/*'
  s.swift_version = '5.0'
end
