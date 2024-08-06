//
//  UIStackView + Extension.swift
//  instruction-screen
//
//  Created by Mac on 8/6/24.
//

import Foundation
import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addArrangedSubview(view)
        }
    }
}

