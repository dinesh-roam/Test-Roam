
Pod::Spec.new do |s|
  s.name                  = 'test-roam-ios'
  s.version               = '0.1.0'
  s.summary               = 'High accuracy and battery efficient location SDK for iOS by Roam.ai'
  s.homepage              = 'https://roam.ai'
  s.author                = { 'Roam B.V' => 'support@roam.ai' }
  s.platform              = :ios
  s.source                = { :git => 'https://github.com/dinesh-roam/Test-Roam.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.requires_arc          = true
  s.license               = { :type => 'Copyright',:text => 'Copyright (c) 2023 Roam B.V, All rights reserved.' }
  
  
  # CoreModule
  s.subspec 'Test-RoamCore' do |core|
  
    core.vendored_frameworks = 'Roam/Roam.xcframework','Roam/AWSAuthCore.xcframework', 'Roam/AWSCognitoIdentityProvider.xcframework', 'Roam/AWSCognitoIdentityProviderASF.xcframework', 'Roam/AWSCore.xcframework','Roam/AWSIoT.xcframework','Roam/AWSMobileClientXCF.xcframework'
  end
  
  # FeatureModule
  s.subspec 'Test-RoamMQTTConnector' do |feature|
  
  if ENV['EXCLUDE_CocoaMQTT'] == 'true'
    feature.exclude_files = 'Roam/CocoaMQTT.xcframework'
  else
    feature.vendored_frameworks = 'Roam/CocoaMQTT.xcframework'
  end
  feature.vendored_frameworks = 'Roam/RoamMQTTConnector.xcframework', 'Roam/MqttCocoaAsyncSocket.xcframework', 'Roam/Starscream.xcframework'
end

end

