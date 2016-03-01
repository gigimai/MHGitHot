platform :ios, '8.0'
use_frameworks!

target 'MHGitHot' do
    pod 'ChameleonFramework'
    pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift2'
    pod 'Alamofire', '~> 3.0'
    pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'
end
def testing_pods
    pod 'Quick', '~> 0.9.0'
    pod 'Nimble', '3.0.0'
end
target 'MHGitHotTests' do
    testing_pods
end

target 'MHGitHotUITests' do
    testing_pods
end

