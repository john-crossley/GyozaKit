#
# Be sure to run `pod lib lint GyozaKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = 'GyozaKit'
  s.version = '0.1.1'
  s.summary = 'GyozaKit for iOS allows you to create a simple message to display to your user'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  GyozaKit for iOS allows you to create a simple message with or without an action to display to your users. Once the gyoza is invoked, it'll pop into view with a simple animation.
                       DESC

  s.homepage         = 'https://github.com/john-crossley/GyozaKit'
  s.screenshots      = ['https://raw.githubusercontent.com/john-crossley/GyozaKit/master/Example/GyozaKit/iPhoneSE-Screenshot.png', 'https://raw.githubusercontent.com/john-crossley/GyozaKit/master/Example/GyozaKit/iPhoneX-Screenshot.png']
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'john-crossley' => 'johnpaulcrossley@gmail.com', 'jamesruston' => 'jruston90@gmail.com' }
  s.source           = { :git => 'https://github.com/john-crossley/GyozaKit.git', :tag => s.version }
  s.social_media_url = 'https://twitter.com/jonnothebonno'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Classes/**/*'

#  s.resource_bundles = {
#    'GyozaKit' => ['Assets/*.png']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
