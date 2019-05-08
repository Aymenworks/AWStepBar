Pod::Spec.new do |spec|
  spec.name         = "AWStepBar"
  spec.version      = "1.0.0"
  spec.summary      = "AWStepBar is a UI Component that allows you to integrate a step progress UI within your app."

  spec.description  = <<-DESC
    AWStepBar is a UI Component that allows you to integrate a step progress UI within your app.
  DESC

  spec.homepage     = "https://github.com/Aymenworks/AWStepBar"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Aymen Rebouh" => "aymenmse@gmail.com" }
  spec.social_media_url   = "https://twitter.com/aymenworks"
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/Aymenworks/AWStepBar.git", :tag => "#{spec.version}" }
  spec.source_files  = ['AWStepBar/**/*.{swift,h}']
  spec.public_header_files = 'AWStepBar/**/*.h'
  spec.requires_arc = true
  spec.ios.deployment_target = '9.0'
  spec.swift_version = "5.0"
end
