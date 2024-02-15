//
//  NavigationController+.swift
//  REGO
//
//  Created by kokojong on 2/16/24.
//

import UIKit

// MARK: custom nav 연결 후 back swipe 동작 되도록
extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
