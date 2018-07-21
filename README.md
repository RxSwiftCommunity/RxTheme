# RxTheme

[![Build Status](https://travis-ci.org/RxSwiftCommunity/RxTheme.svg?branch=master)](https://travis-ci.org/RxSwiftCommunity/RxTheme)
[![Version](https://img.shields.io/cocoapods/v/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)
[![License](https://img.shields.io/cocoapods/l/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)
[![Platform](https://img.shields.io/cocoapods/p/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)


## Manual

### Define theme as enum and add computed properties

```swift
enum MDTheme:Int,CaseIterable,CustomStringConvertible {
    case light
    case dark

var description: String {
    switch self {
    case .light:
        return "Light Theme"
    case .dark:
        return "Dark Theme"
    }
}

var backgroundColor: Color {
    switch self {
    case .light:
        return .white
    case .dark:
        return .black
    }
}

var textColor: Color {
    switch self {
    case .light:
        return .black
    case .dark:
        return .white
    }
}


// Initialize the service with either enum case or its raw value
let themeService = ThemeService<Theme>(theme: MDTheme.light)
```

### Apply theme to UI

```swift
themeService.bind([
    ({ $0.textColor }, [label.rx.textColor]),
    ({ $0.backgroundColor }, [view.rx.backgroundColor])
]).disposed(by: disposeBag)
```

### Switch themes

```swift
themeService.set(theme: .dark)
themeService.set(index: 1)
```

### Random theme

```swift
themeService.setRandomTheme()
```

### Get all themes

```swift
themeService.allThemes
```

### Get all theme names

```swift
themeService.allThemeNames
```



### Binder presets

##### UIApplication
- statusBarStyle

##### UIView
- backgroundColor
- tintColor

##### UIButton
- tintColor

##### UILabel
- font
- textColor
- highlightedTextColor
- shadowColor

##### UITextField
- font
- keyboardAppearance
- textColor

##### UIImageView
- image

##### UIProgressView
- progressTintColor
- trackTintColor 

##### UIPageControl
- pageIndicatorTintColor
- currentPageIndicatorTintColor

##### UISlider
- thumbTintColor
- minimumTrackTintColor
- maximumTrackTintColor

##### UIToolbar
- barTintColor

##### UISwitch
- onTintColor
- thumbTintColor

##### UITableView
- separatorColor

##### UINavigationBar
- barStyle
- barTintColor
- titleTextAttributes

##### UITabBar
- barStyle
- barTintColor

##### UITextView
- font
- textColor 

##### UIActivityIndicatorView
- activityIndicatorViewStyle

##### UIBarButtonItem
- tintColor

##### CALayer
- backgroundColor
- borderWidth
- borderColor
- shadowColor


### Extend binders in your codebase

Because RxTheme uses `Binder<T>` from RxCocoa, any `Binder` defined in RxCocoa could be used here. 

This also makes the lib super easy to extend in your codebase, here is an example

```swift
extension Reactive where Base: UIView {
    var borderColor: Binder<UIColor?> {
        return Binder(self.base) { view, color in
            view.layer.borderColor = color?.cgColor
        }
    }
}
```

### Extend binders in the lib

Open `codegen/exts.yml`, add class, attributes and supported os.

```
UIApplication:
  attrs:
    statusBarStyle: UIStatusBarStyle
  os: [iOS]
```

then run codegen script

```shell
// make sure you have python3 and pipenv installed
$ pipenv install
$ pipenv run python -m codegen
```

If you think it's commonly used, please send us a PR.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

RxTheme is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxTheme'
```

## Author

duan, wddwyss@gmail.com

## License

RxTheme is available under the MIT license. See the LICENSE file for more info.
