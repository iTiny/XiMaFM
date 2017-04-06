//
//  FIndFeeDetailModel.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/6.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit
import HandyJSON

class FIndFeeDetailModel: HandyJSON {

    
    var title: String?
    var tags: String?
    var serialState: Int = 0
    var uid: NSNumber?
    var nickname: String?
    var albumCoverUrl290: String?
    var ID: NSNumber?
    
    var coverMiddle: String?
    
    var playsCounts: Int = 0
    
    var intro: String?
    
    var isPaid: Bool = false
    
    var commentsCount: Int = 0
    
    var albumId: Int = 0
    
    var coverSmall: String?
    
    var coverLarge: String?
    
    var tracks: Int = 0
    
    var trackTitle: String?
    
    var priceTypeId: Int = 0
    
    var isFinished: Int = 0
    
    var trackId: Int = 0
    
    var provider: String?
    
    
    required init() {
        
    }
    
}
