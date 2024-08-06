//
//  UIView + Extension.swift
//  instruction-screen
//
//  Created by Mac on 8/6/24.
//

import Foundation
import UIKit

public extension UIView {
    func makeRoundedCornerWithShadow(cornerRadius: Double) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowColor = UIColor.black.cgColor
    }
    
    func addSubViews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}

