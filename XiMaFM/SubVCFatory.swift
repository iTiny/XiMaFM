//
//  SubVCFatory.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/5.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit


//根据不同标题 创建不同VC 

enum FindSubType {
    case FindSubTypeRecommand
    case FindSubTypeCategory
    case FindSubTypeProdcast
    case FindSubTypeRand
    case FindSubTypeAnchor
    case FindSubTypeUnknow
}


class SubVCFatory: NSObject {
    
    
    class func getVCWithTitle(title: String) -> UIViewController? {
        
        let type: FindSubType = typeFromTitle(title: title)
        
        switch type {
        case .FindSubTypeRecommand:
            return RecommendViewController()
        case .FindSubTypeCategory:
            return CategoryViewController()
        case .FindSubTypeProdcast:
            return ProdCastViewController()
        case .FindSubTypeRand:
            return RandViewController()
        case .FindSubTypeAnchor:
            return AnchorViewController()
        default:
            return nil
        }
        
        
    }
    
    private class func typeFromTitle(title: String) -> FindSubType {
        
        switch title {
        case "推荐":
            return .FindSubTypeRecommand
        case "分类":
            return .FindSubTypeCategory
        case "广播":
            return .FindSubTypeProdcast
        case "榜单":
            return .FindSubTypeRand
        case "主播":
            return .FindSubTypeAnchor
        default:
            return .FindSubTypeUnknow
        }
        
    }
    
    
}
