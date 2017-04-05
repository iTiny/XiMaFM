//
//  TitlesView.swift
//  XiMaFM
//
//  Created by Bing on 2017/4/5.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit


protocol FindTitleViewSelectedDelegate: NSObjectProtocol {
    
    func findSubTitleViewDidSelect(_ index: NSInteger, title: String, titleView:TitlesView);
    
}

class TitlesView: UIView {

    weak var delegate:FindTitleViewSelectedDelegate?

    var titlesArr: [String]!
    
    private var btnsArray:[UIButton]?
    
    init(titles:[String], frame: CGRect) {
        super.init(frame: frame)
        
        titlesArr = titles
        
        self.configViews()
    }
    
    func changeSeletedBtn(index: NSInteger) {
        
        for btn in btnsArray! {
            
            if btn.tag == index {
                btn.isSelected = true
            }
            else {
                btn.isSelected = false
            }
            
        }

        
        
        
    }
    
    fileprivate func configViews(){
        
        
        
        let width = CGFloat(self.frame.width)/CGFloat(titlesArr.count)
        let height = self.frame.height
        
        var index = 0
        var btns = [UIButton]()
        for title in titlesArr {
            
            let button = UIButton(type: .custom)
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.lightGray, for: .normal)
            button.setTitleColor(UIColor.orange, for: .selected)
            button.backgroundColor = UIColor.white
            button.tag = index
            button.addTarget(self, action: #selector(btnSelected(sender:)), for: .touchUpInside)
            
            button.frame = CGRect(x: CGFloat(index) * width, y: 0, width: width, height: height)
            
            self.addSubview(button)
            btns.append(button)
            
            index += 1

        }
        
        self.btnsArray = btns
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func btnSelected(sender: UIButton){
        
        delegate?.findSubTitleViewDidSelect(sender.tag, title: sender.currentTitle! , titleView: self)
        
        for btn in btnsArray! {
            
            if btn == sender {
                btn.isSelected = true
            }
            else {
                btn.isSelected = false
            }
            
        }
        
    }
    
    
}
