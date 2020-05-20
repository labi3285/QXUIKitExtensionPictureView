Pod::Spec.new do |s|

s.swift_versions = "5.0"

s.name         = "QXUIKitExtensionPictureView"
s.version      = "0.0.3"
s.summary      = "QXPictrueView UIs base on QXUIKitExtension & "
s.description  = <<-DESC
UIKit extensions in swift. Just enjoy!
DESC
s.homepage     = "https://github.com/labi3285/QXUIKitExtensionPictureView"
s.license      = "MIT"
s.author       = { "labi3285" => "766043285@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/labi3285/QXUIKitExtensionPictureView.git", :tag => "#{s.version}" }
s.source_files = "QXUIKitExtensionPictureView/QXUIKitExtensionPictureView/*"
s.requires_arc = true

s.dependency 'QXUIKitExtension'
s.dependency 'DSImageBrowse', '~> 1.0.2'

# pod trunk push QXUIKitExtensionPictureView.podspec --allow-warnings

end

