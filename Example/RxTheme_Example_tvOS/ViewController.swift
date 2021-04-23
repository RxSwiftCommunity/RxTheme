//
//  ViewController.swift
//  RxTheme_Example_tvOS
//
//  Created by wddwycc on 2018/3/7.
//  2018 Copyright (c) RxSwiftCommunity. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxTheme


class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "presss playPause to switch theme"
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        label.theme.textColor = themed { $0.textColor }
        view.theme.backgroundColor = themed { $0.backgroundColor }

        let tapGesture = UITapGestureRecognizer()
        tapGesture.allowedPressTypes = [NSNumber(value: UIPress.PressType.playPause.rawValue)]
        view.addGestureRecognizer(tapGesture)
        tapGesture.rx.event.withLatestFrom(themeService.typeStream)
            .map { $0 == .dark ? .light : .dark }
            .bind(to: themeService.switcher)
            .disposed(by: disposeBag)
    }
}

