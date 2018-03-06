# RxTheme

[![Version](https://img.shields.io/cocoapods/v/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)
[![License](https://img.shields.io/cocoapods/l/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)
[![Platform](https://img.shields.io/cocoapods/p/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)


## Manual

### Define theme service

```swift
protocol Theme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

struct LightTheme: Theme {
    let backgroundColor = UIColor.white
    let textColor = UIColor.black
}

struct DarkTheme: Theme {
    let backgroundColor = UIColor.black
    let textColor = UIColor.white
}

let themeService = ThemeService<Theme>(themes: [LightTheme(), DarkTheme()])
```

### Apply theme to UI

```swift
themeService.bind({ $0.backgroundColor }, to: view.rx.backgroundColor)
```

### Switch themes

```swift
themeService.set(index: 0)
```

### Binder presets

##### UIApplication
- statusBarStyle

##### UIView
- backgroundColor
- tintColor

##### UIButton
- image
- backgroundImage
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


> If anything missed, PR is welcomed.


### Extend binders

Because RxTheme uses `Binder<T>` from RxCocoa, any `Binder` defined in RxCocoa could be used here. 

This also makes the lib super easy to extend. You just extend RxCocoa:

```swift
extension Reactive where Base: UIView {
    var borderColor: Binder<UIColor?> {
        return Binder(self.base) { view, color in
            view.layer.borderColor = color?.cgColor
        }
    }
}
```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS >= 9.0
* Swift 4

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
