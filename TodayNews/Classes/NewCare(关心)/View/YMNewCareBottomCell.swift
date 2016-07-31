//
//  YMNewCareBottomCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

class YMNewCareBottomCell: UITableViewCell {

    @IBOutlet weak var titleImageView: UIImageView!
    // 关注标题
    @IBOutlet weak var titleLabel: UILabel!
    // 关注人数
    @IBOutlet weak var peopleCountLabel: UILabel!
    // 评论条数
    @IBOutlet weak var commentCountLabel: UILabel!
    // 关心按钮
    @IBOutlet weak var careButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        careButton.layer.cornerRadius = 7
        careButton.layer.masksToBounds = true
        careButton.layer.borderColor = YMColor(91, g: 162, b: 207, a: 1.0).CGColor
        careButton.layer.borderWidth = klineWidth
        careButton.layer.shouldRasterize = true
        careButton.layer.rasterizationScale = UIScreen.mainScreen().scale
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
