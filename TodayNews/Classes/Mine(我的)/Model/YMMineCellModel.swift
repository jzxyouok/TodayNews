//
//  YMMineCellModel.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMMineCellModel: NSObject {
    
    var title: String?
    var subtitle: String?
    var isHiddenLine: Bool?
    var isHiddenSubtitle: Bool?
    
    init(dict: [String: AnyObject]) {
        super.init()
        title = dict["title"] as? String
        subtitle = dict["subtitle"] as? String
        isHiddenLine = dict["isHiddenLine"] as? Bool
        isHiddenSubtitle = dict["isHiddenSubtitle"] as? Bool
    }
}
