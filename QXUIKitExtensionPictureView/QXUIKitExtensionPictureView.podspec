Pod::Spec.new do |s|

s.name         = "QXUIKitExtensionPictureView"
s.version      = "0.4.0"
s.summary      = "UIKit extensions in swift5."
s.description  = <<-DESC
UIKit extensions in swift. Just enjoy!
DESC
s.homepage     = "https://github.com/labi3285/QXUIKitExtensionPictureView"
s.license      = "MIT"
s.author       = { "labi3285" => "766043285@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/labi3285/QXUIKitExtensionPictureView.git", :tag => "#{s.version}" }

s.source_files = "QXUIKitExtensionPictureView/*"
s.requires_arc = true

s.frameworks   = "MobileCoreServices", "ImageIO"
s.library = 'sqlite3'

s.dependency 'QXUIKitExtension'
s.dependency 'QXDSImageBrowse'


end

