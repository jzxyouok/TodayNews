//
//  YMMineNoLoginHeaderView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/31.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMMineNoLoginHeaderView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func noLoginHeaderView() -> YMMineNoLoginHeaderView {
        return NSBundle.mainBundle().loadNibNamed(String(self), owner: nil, options: nil).last as! YMMineNoLoginHeaderView
    }
}
