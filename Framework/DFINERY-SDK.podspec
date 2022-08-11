Pod::Spec.new do |s|
s.name          = "DFINERY-SDK"
s.version       = "0.0.1"
s.summary          = "igaworks 과제 SDK"
s.homepage         = "https://github.com/JiHoonAHN/DFINERY"
s.author           = { 'JiHoonAHN' => 'ahnjh1028@naver.com' }
s.source           = { :git => "https://github.com/JiHoonAHN/DFINERY.git",
:tag => s.version.to_s }
s.source_files     = "DFINERY-SDK/..."
s.requires_arc     = true

s.swift_version = "5.0"
s.ios.deployment_target = "13.0"
end
