# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'githubsample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for githubsample
  
  def reactive_pods 
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxDataSources'
    pod 'RxOptional'
  end

  def tests_pods
    pod 'Quick'
    pod 'Nimble'
  end

  target 'githubsampleTests' do
    inherit! :search_paths
    # Pods for testing
    tests_pods
  end

  target 'githubsampleUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end