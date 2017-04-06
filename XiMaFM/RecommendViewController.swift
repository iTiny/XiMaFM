//
//  RecommendViewController.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/5.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit

class RecommendViewController: BGFindSubViewController {


    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        
        return tableView
    
    }()
    
    lazy var viewModel: FindRecommendViewModel = {
        
        return FindRecommendViewModel()
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red
        
        viewModel.requestData()
        
        viewModel.updateBlock = {
            
            
            
        }
        
        
    }


}
