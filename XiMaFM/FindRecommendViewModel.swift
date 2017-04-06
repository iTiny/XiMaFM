//
//  FindRecommendViewModel.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/6.
//  Copyright © 2017年 Bing. All rights reserved.
//
//view model

import UIKit
import SwiftyJSON
import HandyJSON

class FindRecommendViewModel: NSObject {

    
    var editorRecommendAlbums: EditorRecommendAlbumsModel!
    var focusImages: FocusImagesModel!
    var special: SpecialDetailModel!
    
    var updateBlock:(()->Void)?
//    var completionHandler: (Float)->Void = {_ in }
//    var completionHandler: (Float)->Void = {
//        (arg: Float) -> Void in
//    }
//    var completionHandler: (Float)->Void = { arg in }

//    var completionHandler: ((Float)->Void)?


    // MARK:- 数据更新回调
//    typealias AddBlock = (()->Void)
//    var updateBlock = AddBlock?()
    
    override init() {
        
    }

    func requestData(){
        
        FindAPI.requestRecommends { [unowned self] (result, error) in
            
            if result != nil {
                
                let json = JSON(result!)
                
                //editorRecommendAlbums
                let editorRecommendAlbums = JSONDeserializer<EditorRecommendAlbumsModel>.deserializeFrom(json: json["editorRecommendAlbums"].description)
                self.editorRecommendAlbums = editorRecommendAlbums
                
                //focusImages
                let focusImages = JSONDeserializer<FocusImagesModel>.deserializeFrom(json: json["focusImages"].description)
                self.focusImages = focusImages
                
                
                //special
                let special = JSONDeserializer<SpecialDetailModel>.deserializeFrom(json: json["specialColumn"].description)
                self.special = special
                

            }
            else {
                print("request error:\(String(describing: error))")
            }
            
            self.updateBlock?()
            
        }
        
    }
    
    
}
