Pod::Spec.new do |s|

  s.name         = "Finch"
  s.version      = "0.0.2"
  s.summary      = "Simple, low-latency OpenAL sound engine for Apple iOS."

  s.description  = <<-DESC
                   A longer description of Finch in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "http://github.com/uken/Finch/"
  s.license      = 'MIT (Copyright (c) 2013, Uken Games)'
  s.author       = { "Uken Games" => "ehab@uken.com" }

  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/uken/Finch.git", :commit => "13f76e050042ba3adc0f4ac20ac436ebdb37d7a4" }

  # s.ios.deployment_target = '5.0'

  s.prefix_header_file = 'Finch/Lib-Prefix.pch'
  s.source_files  = 'Finch', 'Finch/**/*.{h,m,mm,cpp}'
  s.public_header_files = 'Finch/**/*.h'
  s.exclude_files = 'Finch/**/*Test*'

  s.frameworks  = 'OpenAL', 'AVFoundation', 'AudioToolbox', 'SenTestingKit', 'MediaPlayer'

  s.requires_arc = true

  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC'}

end
