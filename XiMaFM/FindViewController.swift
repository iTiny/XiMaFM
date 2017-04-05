//
//  FindViewController.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/1.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit

class FindViewController: BaseViewController,BGPageViewControllerDelegate, FindTitleViewSelectedDelegate {

    
    
    /// lazy：使用的时候调用，闭包()
    lazy var subTitles:[String] = {
        return ["推荐","分类","广播","榜单","主播"]
    }()
    
    var subControllers:[UIViewController]!
    var bgPageViewController:BGPagesViewController!
    var titlesView:TitlesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.title = "发现"
        
        
        let titlesView = TitlesView(titles: subTitles, frame: CGRect(x: 0, y: 64.0, width: kWinSize.width, height: 44))
        titlesView.delegate  = self
        self.view.addSubview(titlesView)
        titlesView.changeSeletedBtn(index: 0)
        self.titlesView = titlesView
        
        var controllers = [UIViewController]()
        for title in self.subTitles {
            
            let controller = SubVCFatory.getVCWithTitle(title: title)
            controllers.append(controller!)
            
        }
        subControllers = controllers
        
        
        let pageVC =  BGPagesViewController(superVC: self, controllers: subControllers)
        pageVC.delegate = self
//        pageVC.view.backgroundColor = UIColor.red
        self.view.addSubview(pageVC.view)
        self.bgPageViewController = pageVC
        
        bgPageViewController.view.snp.makeConstraints { (make) in
            
            make.top.equalTo(titlesView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottom).offset(-49)
            
        }
        
    }
    
    func bgPageVCSubViewControllerIndex(index: NSInteger, pageVC: BGPagesViewController) {
        
        self.titlesView.changeSeletedBtn(index: index)
        
    }
    
    
    func findSubTitleViewDidSelect(_ index: NSInteger, title: String, titleView: TitlesView) {
        
        self.bgPageViewController.setCurrentViewControllerWithIndex(index: index)
        
    }


}
