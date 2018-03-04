# RxTheme

[![Version](https://img.shields.io/cocoapods/v/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)
[![License](https://img.shields.io/cocoapods/l/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)
[![Platform](https://img.shields.io/cocoapods/p/RxTheme.svg?style=flat)](http://cocoapods.org/pods/RxTheme)

## Define theme service

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

## Apply theme to UI

```swift
themeService.apply({ $0.backgroundColor }, to: view.rx.backgroundColor)
```

## Switch themes

```swift
themeService.set(index: 0)
```


## Extend property to apply

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
