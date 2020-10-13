platform :ios, '10.0'
use_frameworks!

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'Monsters' do
    pod 'Magics'
    pod 'RealmSwift'
    pod 'GoogleMaps'
    pod 'GooglePlaces'
    pod 'SideMenuSwift'
end

target 'MonstersTests' do
    pod 'Magics'
    pod 'OHHTTPStubs/Swift'
    pod 'RealmSwift'
    testing_pods
end

target 'MonstersUITests' do
    testing_pods
end

