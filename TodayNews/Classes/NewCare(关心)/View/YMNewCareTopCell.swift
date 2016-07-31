//
//  YMNewCareCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMNewCareTopCell: UITableViewCell {
    
    

    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var newButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newButton.layer.cornerRadius = 8
        newButton.layer.masksToBounds = true
        newButton.layer.shouldRasterize = true
        newButton.layer.rasterizationScale = UIScreen.mainScreen().scale
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
