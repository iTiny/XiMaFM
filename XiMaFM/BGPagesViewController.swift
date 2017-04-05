//
//  BGPagesViewController.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/5.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit

protocol BGPageViewControllerDelegate: NSObjectProtocol {
    
    func bgPageVCSubViewControllerIndex(index: NSInteger, pageVC:BGPagesViewController)
    
}

class BGPagesViewController: BaseViewController {

    weak var delegate: BGPageViewControllerDelegate?
    
    var subControllers = [UIViewController]()
    var superController: UIViewController!
    
    var pageVC: UIPageViewController!
    
    init(superVC: UIViewController, controllers: [UIViewController]) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.superController = superVC
        self.subControllers = controllers
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup()
    }
    
    func setCurrentViewControllerWithIndex(index: NSInteger) {
        self.pageVC.setViewControllers([subControllers[index]], direction: .forward, animated: false, completion: nil)
    }
    
    
    
    fileprivate func setup(){
        
//        let options: [String : Any] = [UIPageViewControllerOptionSpineLocationKey : NSNumber(integerLiteral: UIPageViewControllerSpineLocation.none.rawValue)]

        let page = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageVC = page
        page.delegate = self
        page.dataSource = self
        //必须要初始化subControllers
        page.setViewControllers([subControllers.first!], direction: .forward, animated: false, completion: nil)
        
        
        page.view.frame = self.view.frame
        
        self.view.addSubview(page.view)
        
    }
    
}

extension BGPagesViewController {
    
//    
    
}


// MARK: - UIPageViewControllerDelegate,UIPageViewControllerDataSource
extension BGPagesViewController: UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let vc = pageViewController.viewControllers?[0] else {return}
        let index = self.subControllers.index(of: vc)
        
        //切换按钮状态
        delegate?.bgPageVCSubViewControllerIndex(index: index!, pageVC: self)
        
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
        guard let index = self.subControllers.index(of: viewController) else {return nil}
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        return self.subControllers[index - 1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
     
        guard let index = self.subControllers.index(of: viewController) else {return nil}
        if index == subControllers.count - 1 || index == NSNotFound {
            return nil
        }
        
        return subControllers[index+1]
        
    }
 
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return subControllers.count
    }
    
}
