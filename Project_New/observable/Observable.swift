//
//  Observable.swift
//  Project_New
//
//  Created by Apple on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class Observable<T> {

    typealias EventListener = (T) -> Void

    var listener: EventListener?
    var value: T {
        didSet {
            listener?(self.value)
        }
    }

    init(value: T) {
        self.value = value
    }

    public func bind(listener: EventListener?) {
        self.listener = listener
    }

    public func bindAndFire(listener: EventListener?) {
        self.listener = listener
        self.listener?(value)
    }
}
