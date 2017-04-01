//
//  MainTabBarController.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/1.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let controllers:[UIViewController] = self.viewControllers!
//        let titles = ["发现","订阅","下载","我的"]
        let images_n = [#imageLiteral(resourceName: "tabbar_find_n"),#imageLiteral(resourceName: "tabbar_sound_n"),#imageLiteral(resourceName: "tabbar_download_n"),#imageLiteral(resourceName: "tabbar_me_n")];
        let images_h = [#imageLiteral(resourceName: "tabbar_find_h"),#imageLiteral(resourceName: "tabbar_sound_h"),#imageLiteral(resourceName: "tabbar_download_h"),#imageLiteral(resourceName: "tabbar_me_h")];
        
        var index = 0
        for controller: UIViewController in controllers {
            
//            let title = titles[index]
            let image_n = images_n[index].withRenderingMode(.alwaysOriginal)
            let image_h = images_h[index].withRenderingMode(.alwaysOriginal)
            
            controller.tabBarItem.image = image_n
            controller.tabBarItem.selectedImage = image_h
            
            controller.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
            
            index += 1
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
