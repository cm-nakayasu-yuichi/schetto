# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF'] = false
        end
    end
end

target 'schetto' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'Alamofire'
  pod 'AlamofireImage'
  pod 'Realm'#, :git => 'https://github.com/realm/realm-cocoa.git', :submodules => true
  pod 'RealmSwift'#, :git => 'https://github.com/realm/realm-cocoa.git', :submodules => true

  target 'schettoTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
