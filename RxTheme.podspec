Pod::Spec.new do |s|
  s.name             = 'RxTheme'
  s.version          = '5.0.4'
  s.summary          = 'Theme management based on RxCocoa'
  s.description      = <<-DESC
Theme management based on RxSwift and RxCocoa, easy to use, easy to extend.
                       DESC
  s.homepage         = 'https://github.com/RxSwiftCommunity/RxTheme'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wddwycc' => 'wddwyss@gmail.com' }
  s.source           = { :git => 'https://github.com/RxSwiftCommunity/RxTheme.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/wddwycc'

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '3.0'

  s.swift_version = '5.1'
  s.requires_arc = true

  s.source_files = 'Sources/**/*'
  
  s.dependency 'RxSwift', '~> 6.0'
  s.dependency 'RxCocoa', '~> 6.0'
end

