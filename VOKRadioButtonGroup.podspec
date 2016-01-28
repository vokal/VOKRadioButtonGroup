Pod::Spec.new do |s|
  s.name             = "VOKRadioButtonGroup"
  s.version          = "0.1.0"
  s.summary          = "VOKRadioButtonGroup"
  s.homepage         = "https://github.com/vokal/VOKRadioButtonGroup"
  s.license          = "© Copyright Vokal"
  s.author           = { "Vokal" => "hello@vokal.io" }
  s.source           = { :git => "https://github.com/vokal/VOKRadioButtonGroup.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = [
    'RadioButtonGroup-iOS/VOKRadioButtonGroup.{h,m}',
  ]
end
