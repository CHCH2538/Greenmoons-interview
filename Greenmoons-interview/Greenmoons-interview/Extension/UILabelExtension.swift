//
//  UILabelExtension.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//

import UIKit

extension UILabel {
    @IBInspectable var autoScaleFontSize: CGFloat {
        get {
            return 0.0
        }
        set {
            if newValue > 0 {
                let originalFontSize = font.pointSize
                let screenWidth = UIScreen.main.bounds.width
                let scaleFactor = screenWidth / 375.0
                let scaledFontSize = originalFontSize * scaleFactor

                font = font.withSize(scaledFontSize)
            }
        }
    }
}
