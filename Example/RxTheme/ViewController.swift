//
//  ViewController.swift
//  RxTheme
//
//  Created by duan on 03/04/2018.
//  Copyright (c) 2018 wddwyss@gmail.com. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxTheme

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


class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        tapGesture.rx.event
            .bind { (_) in
                let themeIndex = themeService.index
                themeService.set(index: themeIndex == 0 ? 1 : 0)
            }
            .disposed(by: disposeBag)

        let label = UILabel()
        label.text = "Tap to switch theme"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        themeService.binder().map { $0.backgroundColor }
            .bind(to: view.rx.backgroundColor)
            .disposed(by: disposeBag)

        themeService.binder().map { $0.textColor }
            .bind(to: label.rx.textColor)
            .disposed(by: disposeBag)
    }
}

