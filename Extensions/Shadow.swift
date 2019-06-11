//
//  Shadow.swift
//  Test1
//
//  Created by Daniel Garcia on 6/6/19.
//  Copyright © 2019 Fredy Dominguez. All rights reserved.
//

import UIKit

extension UIView {
    var borderUIColor: UIColor {
        get{
            guard let color = layer.borderColor else{
                return UIColor.black
            }
            return UIColor(cgColor: color)
        }
        set{
            layer.borderColor = newValue.cgColor
        }
    }
}
