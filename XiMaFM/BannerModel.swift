//
//  BannerModel.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/6.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit
import HandyJSON

class BannerModel: HandyJSON {

    var ID: NSNumber?
    var shortTitle: String?
    var pic: String?
    var longTitle: String?
    var type: Int = 0
    var uid: NSNumber?
    var albumId: NSNumber?
    var isShare: Bool =  false
    var focusCurrentId: NSNumber?
    
    required init(){}
    
}
