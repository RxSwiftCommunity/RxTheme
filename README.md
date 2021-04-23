# RxTheme

[![Build Status](https://travis-ci.org/RxSwiftCommunity/RxTheme.svg?branch=master)](https://travis-ci.org/RxSwiftCommunity/RxTheme)
[![Version](https://img.shields.io/cocoapods/v/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)
[![Platform](https://img.shields.io/cocoapods/p/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)

## Manual

### Define theme service

```swift
import RxTheme

protocol Theme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

struct LightTheme: Theme {
    let backgroundColor = .white
    let textColor = .black
}

struct DarkTheme: Theme {
    let backgroundColor = .black
    let textColor = .white
}

enum ThemeType: ThemeProvider {
    case light, dark
    var associatedObject: Theme {
        switch self {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        }
    }
}

let themeService = ThemeType.service(initial: .light)
```

### Apply theme to UI

```swift

// Bind stream to a single attribute
// RxTheme would automatically manage the lifecycle of the binded stream
view.theme.backgroundColor = themeService.attribute { $0.backgroundColor }
```

### Switch themes

```swift
themeService.switch(.dark)
// When this is triggered by some signal, you can use:
someSignal.bind(to: themeService.switcher)
```

### Other APIs

```swift
// Current theme type
themeService.type
// Theme type stream
themeService.typeStream
```

## Examples

You can run the example project, clone the repo, run `pod install` from the Example directory first, and open up the workspace file.

## Installation

### SPM

1. File > Swift Packages > Add Package Dependency
2. Add https://github.com/RxSwiftCommunity/RxTheme

### Cocoapods

```ruby
pod 'RxTheme', '~> 5.0'
```

### Carthage

```
github "RxSwiftCommunity/RxTheme" ~> 5.0.0
```

## Author

duan, wddwyss@gmail.com

## License

RxTheme is available under the MIT license. See the LICENSE file for more info.
