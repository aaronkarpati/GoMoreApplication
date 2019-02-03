//
//  Theme.swift
//  GoMoreApplication
//
//  Created by Áron Kárpáti on 2019. 02. 02..
//  Copyright © 2019. Áron Kárpáti. All rights reserved.
//

import Foundation
import UIKit

class Theme {
    
    class color {
        
        class func goBlue() -> UIColor{
            return UIColor(red:0.00, green:0.71, blue:0.86, alpha:1.0)
        }
        
        class func goGrey() -> UIColor{
            return UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.0)
        }
        
        class func goGreen() -> UIColor{
            return UIColor(red:0.31, green:0.80, blue:0.40, alpha:1.0)
        }
        
        class func goOrange() -> UIColor{
            return UIColor(red:0.96, green:0.54, blue:0.00, alpha:1.0)
        }
        
    }
    
    class View{
        
        class func doubleButtonView() -> UIView{
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            view.layer.backgroundColor = UIColor.white.cgColor
            view.layer.cornerRadius = 6
            view.clipsToBounds = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
        
    }
    
    class Buttons {
        
        class func roundedButton(title: String, radius: CGFloat, textColor: UIColor, bgColor: UIColor) -> UIButton{
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.layer.cornerRadius = radius
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.setTitleColor(textColor, for: .normal)
            button.backgroundColor = bgColor
            button.clipsToBounds = true
            return button
        }
        
    }
    
}
