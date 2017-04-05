//
//  GeneralExtensions.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/1.
//  Copyright © 2017年 Bing. All rights reserved.
//

import Foundation
import UIKit
import SnapKit



extension UIColor {
    
    class func colorWithHex(_ hexValue: Int) -> UIColor {
        
        return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
                       
                       green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
                       
                       blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
                       
                       alpha: 1.0)
 
    }
    
    
    
}
