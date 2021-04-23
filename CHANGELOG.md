# changelog

## 6.0.0

- Injected a setter before binding
- Remove old multi-bind API

## 5.0.4

- Add SPM support

## 5.0.0

It is a major release to adopt RxSwift 6.0, generally no breaking change should be introduced.

Adopt RxSwift 6.0
Remove redundent rx extensions since RxSwift 6 introduced @dynamicMemberLookup for Reactive<T>
README renew

## 4.1.1

- Support `UINavigationBar.largeTitleTextAttributes`

## 4.1.0

- Support `UISegmentedControl.selectedSegmentTintColor`

## 4.0.0

- Update RxSwift & RxCocoa dependencies to 5.0, and removed all warnings.
- Remove rx.bind(until: API, to encourage use a disposeBag to define lifetime of binding
- Better test coverage
