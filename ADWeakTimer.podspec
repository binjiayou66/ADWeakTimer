Pod::Spec.new do |adwt|

  adwt.name                = "ADWeakTimer"
  adwt.version             = "0.0.1"
  adwt.summary             = "My modulization part ADWeakTimer."

  adwt.description         = <<-DESC
                            My modulization part ADWeakTimer. It solves the problem of circular strong reference between the NSTimer object and its owner.
                          DESC

  adwt.homepage            = "https://binjiayou66.github.io/"
  adwt.license             = { :type => "MIT", :file => "LICENSE" }
  adwt.author              = { "naibin.liu" => "binjiayou66@163.com" }
  adwt.platform            = :ios, "7.0"
  adwt.source              = { :git => "https://github.com/binjiayou66/ADWeakTimer.git", :tag => "#{adwt.version}" }
  adwt.source_files        = "ADWeakTimer/ADWeakTimer/**/*.{h,m}"
  adwt.requires_arc        = true
  
end