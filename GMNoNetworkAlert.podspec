#
# Be sure to run `pod lib lint GMNoNetworkAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GMNoNetworkAlert'
  s.version          = '0.1.0'
  s.summary          = '无网络时的 屏幕提示'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
在 应用 第一次启动时，加载的第一个页面 无网络提示 在网络状态变化时  无网络提示页面 也会 加载
                       DESC

  s.homepage         = 'https://github.com/ioszhanghui/GMNoNetworkAlert.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ioszhanghui@163.com' => 'yomingyo@gmail.com' }
  s.source           = { :git => 'https://github.com/ioszhanghui/GMNoNetworkAlert.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
    s.prefix_header_contents = '#import <Masonry/Masonry.h>','#import <GMmacros/macros.h>','#import <GMNetworkManager/GMNetworkManager.h>'

  s.ios.deployment_target = '9.0'
  
  s.requires_arc = true
  
  s.resources = ['GMNoNetworkAlert/Assets/*.png']

  s.source_files = 'GMNoNetworkAlert/Classes/**/*'
  s.dependency 'Masonry'
  s.dependency 'GMmacros'
  s.dependency 'GMNetworkManager'
  
  # s.resource_bundles = {
  #   'GMNoNetworkAlert' => ['GMNoNetworkAlert/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
