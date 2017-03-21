#
# Be sure to run `pod lib lint SObjectKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
# point release in version indicates salesforce API version compliance.
#
Pod::Spec.new do |s|
  s.name             = 'SObjectKit'
  s.version          = '0.1.40'
  s.summary          = 'SObjectKit makes working with Salesforce data easy.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SObjectKit a collection of helpful utility classes and functions for working with Salesforce data types and data objects (SObjects)
                       DESC

  s.homepage         = 'https://github.com/quintonwall/SObjectKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'quintonwall' => '@quintonwall' }
  s.source           = { :git => 'https://github.com/quintonwall/SObjectKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/quintonwall'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SObjectKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SObjectKit' => ['SObjectKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'SwiftyJSON', '>= 3.0.0'
end
