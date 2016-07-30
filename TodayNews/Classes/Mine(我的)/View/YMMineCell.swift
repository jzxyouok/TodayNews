//
//  YMMineCell.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  我的界面 -> cell
//

import UIKit

class YMMineCell: UITableViewCell {
    
    var cellModel: YMMineCellModel? {
        didSet {
            titleLabel.text = cellModel!.title
            subtitleLabel.text = cellModel!.subtitle
            lineView.hidden = cellModel!.isHiddenLine!
            subtitleLabel.hidden = cellModel!.isHiddenSubtitle!
        }
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
