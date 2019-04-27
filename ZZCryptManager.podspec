#
# Be sure to run `pod lib lint ZZCryptManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZZCryptManager'
  s.version          = '0.1.1'
  s.summary          = 'ZZCryptManager.'


  s.description      = <<-DESC
                           '方便加解密使用的库ZZCryptManager'
                       DESC

  s.homepage         = 'https://github.com/liguoliangiOS/ZZCryptManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liguoliang' => 'ligl@chinamobiad.com' }
  s.source           = { :git => 'https://github.com/liguoliangiOS/ZZCryptManager.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version =  '5.0'

  s.source_files = 'ZZCryptManager/Classes/**/*'
  
#  s.frameworks = 'UIKit', 'Security','CommonCrypto'


end
