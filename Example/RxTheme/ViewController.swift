//
//  ViewController.swift
//  RxTheme
//
//  Created by wddwycc on 03/04/2018.
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
        label.text = "Tap to switch theme"
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        themeService.bind([
            ({ $0.textColor }, [label.rx.textColor]),
            ({ $0.backgroundColor }, [view.rx.backgroundColor])
        ]).disposed(by: disposeBag)

        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        tapGesture.rx.event
            .bind { (_) in
                let themeIndex = themeService.index
                themeService.set(index: themeIndex == 0 ? 1 : 0)
            }
            .disposed(by: disposeBag)
    }
}
