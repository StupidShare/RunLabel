Pod::Spec.new do |s|
s.name         = "RunLabel"
s.version      = "0.0.3"
s.summary      = "简易滚动文字控件"
s.homepage     = "https://github.com/StupidShare/RunLabel"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "StupidShare" => "iCnSey@gmail.com" }
s.platform     = :ios
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/StupidShare/RunLabel.git", :tag => "#{s.version}" }
s.source_files  = "RunLabel","RunLabel/RunLabel/*/*.{h,m}"
s.requires_arc = true
end
