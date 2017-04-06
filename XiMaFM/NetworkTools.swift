//
//  NetworkTools.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/6.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit

import Alamofire

enum RequestType: Int {
    
    case GET
    case POST
    
}


class NetworkTools: NSObject {

    //singleton
    static let shareInstance: NetworkTools = {
        let tools = NetworkTools()
        return tools
    }()
    
    
    func requestData(requestType: RequestType, urlString: String, parameters:[String: AnyObject]?, finished:@escaping ((_ result: AnyObject?, _ error: Error?)->())){
    
        
//        let callBack = {(response: DataResponse<Any>) in
//            
//            if response.result.isSuccess {
//                
//            }
//            else {
//                
//            }
//            
//        }
        
        request(urlString, method: requestType == .GET ? .get : .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response: DataResponse<Any>) in
            
            if response.result.isSuccess {
                finished(response.result.value as AnyObject,nil)
            } else {
              finished(nil, response.result.error as Error?)
            }
            
        }
    
    }
    
}
