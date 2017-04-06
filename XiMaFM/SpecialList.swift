//
//  SpecialList.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/6.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit
import HandyJSON

class SpecialList: HandyJSON {

    var ret: Int = 0
    var title: String?
    var hasMore: Bool = false
    var list:[SpecialDetailModel]?
    
    required init(){}
    
}
