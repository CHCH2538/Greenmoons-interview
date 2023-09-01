//
//  UIViewExtension.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 1/9/2566 BE.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadiusTopLeft: CGFloat {
        get {
            return layer.maskedCorners.contains(.layerMinXMinYCorner) ? layer.cornerRadius : 0
        }
        set {
            var corners = layer.maskedCorners
            if newValue > 0 {
                corners.insert(.layerMinXMinYCorner)
            } else {
                corners.remove(.layerMinXMinYCorner)
            }
            layer.maskedCorners = corners
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }
    
    @IBInspectable var cornerRadiusTopRight: CGFloat {
        get {
            return layer.maskedCorners.contains(.layerMaxXMinYCorner) ? layer.cornerRadius : 0
        }
        set {
            var corners = layer.maskedCorners
            if newValue > 0 {
                corners.insert(.layerMaxXMinYCorner)
            } else {
                corners.remove(.layerMaxXMinYCorner)
            }
            layer.maskedCorners = corners
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }
    
    @IBInspectable var cornerRadiusBottomLeft: CGFloat {
        get {
            return layer.maskedCorners.contains(.layerMinXMaxYCorner) ? layer.cornerRadius : 0
        }
        set {
            var corners = layer.maskedCorners
            if newValue > 0 {
                corners.insert(.layerMinXMaxYCorner)
            } else {
                corners.remove(.layerMinXMaxYCorner)
            }
            layer.maskedCorners = corners
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }
    
    @IBInspectable var cornerRadiusBottomRight: CGFloat {
        get {
            return layer.maskedCorners.contains(.layerMaxXMaxYCorner) ? layer.cornerRadius : 0
        }
        set {
            var corners = layer.maskedCorners
            if newValue > 0 {
                corners.insert(.layerMaxXMaxYCorner)
            } else {
                corners.remove(.layerMaxXMaxYCorner)
            }
            layer.maskedCorners = corners
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }
}
