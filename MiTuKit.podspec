Pod::Spec.new do |spec|
	spec.name         = "MiTuKit"
	spec.version      = "1.0.1"
	spec.summary = "Extensions based on UIKit to speed up coding and improve clarity."
	spec.swift_versions = ['5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7', '5.8', '5.9']
    spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.9', 'SWIFT_OPTIMIZATION_LEVEL' => '-Onone' }

	spec.description  = <<-DESC
    HI,
    MiTuKit is a lightweight and powerful Swift library designed to accelerate development with UIKit.
It provides a collection of essential classes and extensions, simplifying coding by leveraging inheritance
and reusable components. With MiTuKit, developers can write cleaner and more efficient code, enhancing
productivity in iOS projects.
    
                   DESC

	spec.homepage     = "https://mituultra.com/"
	spec.license      = { :type => "MIT", :file => "LICENSE" }
	spec.author             = { "Mitu Ultra" => "support@mituultra.com" }
	spec.platform     = :ios, "13.0"
	spec.ios.deployment_target = '13.0'

	spec.frameworks   = 'UIKit', 'Foundation'

	spec.source       = { :git => "https://github.com/hominhtuong/MiTuKit.git", :tag => "#{spec.version}" }
	spec.source_files  = 'Sources/**/*.swift'

end
