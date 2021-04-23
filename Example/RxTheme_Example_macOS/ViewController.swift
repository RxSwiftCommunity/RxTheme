//
//  ViewController.swift
//  RxTheme_Example_macOS
//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import Cocoa
import RxSwift
import RxCocoa
import RxTheme


extension Reactive where Base: NSTextField {
    /// Bindable sink for `textColor` property
    var textColor: Binder<CGColor?> {
        return Binder(self.base) { view, attr in
            if let attr = attr, let nsColor = NSColor(cgColor: attr) {
                view.textColor = nsColor
            } else {
                view.textColor = nil
            }
        }
    }
}

public extension ThemeProxy where Base: NSTextField {

    /// (set only) bind a stream to textColor
    var textColor: ThemeAttribute<NSColor?> {
        get { fatalError("set only") }
        set {
            base.textColor = newValue.value
            let disposable = newValue.stream
                .take(until: base.rx.deallocating)
                .observe(on: MainScheduler.instance)
                .bind(to: base.rx.textColor)
            hold(disposable, for: "tintColor")
        }
    }

}

class ViewController: NSViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true

        guard #available(OSX 10.12, *) else { return }

        let label = NSTextField.init(labelWithString: "Click to switch theme")
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        label.theme.textColor = themed { $0.textColor }
        view.layer!.theme.backgroundColor = themed { $0.backgroundColor.cgColor }
    }


    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        themeService.switch(themeService.type == .dark ? .light : .dark)
    }

}

