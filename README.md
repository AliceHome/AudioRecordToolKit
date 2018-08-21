# AudioRecordToolKit

[![CI Status](https://img.shields.io/travis/Rey-superlrp/AudioRecordToolKit.svg?style=flat)](https://travis-ci.org/Rey-superlrp/AudioRecordToolKit)
[![Version](https://img.shields.io/cocoapods/v/AudioRecordToolKit.svg?style=flat)](https://cocoapods.org/pods/AudioRecordToolKit)
[![License](https://img.shields.io/cocoapods/l/AudioRecordToolKit.svg?style=flat)](https://cocoapods.org/pods/AudioRecordToolKit)
[![Platform](https://img.shields.io/cocoapods/p/AudioRecordToolKit.svg?style=flat)](https://cocoapods.org/pods/AudioRecordToolKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AudioRecordToolKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AudioRecordToolKit'
```

## Use
* 实例化
```
 let audioTool = HTAudioRecordTool()
```

* 开始录音
```
audioTool.startRecord()
```

* 停止录音
```
audioTool.stopRecord()
```

* 开始播放
```
audioTool.startPlay()
```

* 停止播放
```
audioTool.stopPlay()

```
## Author

Flash, Huidragonaijy@gmail.com

## 注意

1. NSMicrophoneUsageDescription 必须添加到 Infor.plist 文件中

## License

AudioRecordToolKit is available under the MIT license. See the LICENSE file for more info.
