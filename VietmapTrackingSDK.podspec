Pod::Spec.new do |spec|
  spec.name         = "VietmapTrackingSDK"
  spec.version      = "1.0.1"
  spec.summary      = "Vietmap Tracking SDK with C++ Alert Client integration"
  spec.description  = <<-DESC
    VietmapTrackingSDK provides comprehensive location tracking and speed alert functionality
    with integrated C++ Alert Client for real-time route analysis and speed limit detection.
    Features include GPS tracking, speed monitoring, route alerts, and seamless iOS integration.
                   DESC
  
  spec.homepage     = "https://github.com/vietmap/vietmap-tracking-sdk"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Vietmap" => "support@vietmap.vn" }
  
  spec.platform     = :ios, "12.0"
  spec.ios.deployment_target = "12.0"
  
  spec.source       = { 
    :git => "https://github.com/vietmap/vietmap-tracking-sdk.git", 
    :tag => "#{spec.version}" 
  }
  
  # Use prebuilt XCFramework - supports both device and simulator
  spec.vendored_frameworks = "ios/VietmapTrackingSDK.xcframework"
  
  # Include Swift source files to avoid naming conflicts
  spec.source_files = "ios/VietmapTrackingSDK/*.swift"
  
  # Framework requirements
  spec.frameworks = ['Foundation', 'CoreLocation', 'UIKit']
  
  # Build settings
  spec.swift_version = "5.0"
  spec.requires_arc = true
  
  # Compiler flags for C++ integration with enhanced module safety
  spec.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'OTHER_CPLUSPLUSFLAGS' => '-std=c++17',
    'HEADER_SEARCH_PATHS' => '$(inherited)',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'DEFINES_MODULE' => 'YES',
    'SWIFT_SUPPRESS_WARNINGS' => 'YES',
    'GCC_WARN_INHIBIT_ALL_WARNINGS' => 'YES',
    'CLANG_WARN_DOCUMENTATION_COMMENTS' => 'NO',
    'SWIFT_COMPILATION_MODE' => 'wholemodule',
    'SWIFT_OPTIMIZATION_LEVEL' => '-O'
  }
  
  # User target xcconfig for consuming apps
  spec.user_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'CLANG_CXX_LIBRARY' => 'libc++'
  }
end