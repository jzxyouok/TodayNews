//
//  YMMineHeaderBottomView.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  我的界面 -> 头部 view -> 底部白色 view(包含三个按钮)
//

import UIKit
import Kingfisher

protocol YMMineHeaderBottomViewDelegate: NSObjectProtocol {
    
    func headerBottomView(bottomView: YMMineHeaderBottomView, collectionButton: YMVerticalButton)
    func headerBottomView(bottomView: YMMineHeaderBottomView, nightButton: YMVerticalButton)
    func headerBottomView(bottomView: YMMineHeaderBottomView, settingButton: YMVerticalButton)
    
}

class YMMineHeaderBottomView: UIView {

    weak var delegate: YMMineHeaderBottomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        // 设置三个按钮
        setupUI()
    }
    
    /// 设置三个按钮
    private func setupUI() {
        // 添加收藏按钮
        addSubview(collectionButton)
        // 添加夜间按钮
        addSubview(nightButton)
        // 添加设置按钮
        addSubview(settingButton)
        
        collectionButton.snp_makeConstraints { (make) in
            make.width.equalTo(50)
            make.top.bottom.equalTo(self)
            make.left.equalTo(self).offset(50)
            make.right.lessThanOrEqualTo(nightButton).offset(-kMargin)
        }
        
        nightButton.snp_makeConstraints { (make) in
            make.width.equalTo(50)
            make.top.bottom.equalTo(self)
            make.centerX.equalTo(self.centerX)
        }
        
        settingButton.snp_makeConstraints { (make) in
            make.width.equalTo(50)
            make.top.bottom.equalTo(self)
            make.right.equalTo(self).offset(-50)
            make.right.greaterThanOrEqualTo(nightButton).offset(kMargin)
        }
    }
    
    /// 懒加载，创建收藏按钮
    private lazy var collectionButton: YMVerticalButton = {
        let collectionButton = YMVerticalButton()
        collectionButton.setTitle("收 藏", forState: .Normal)
        collectionButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        collectionButton.addTarget(self, action: #selector(collectionBtnClick(_:)), forControlEvents: .TouchUpInside)
        collectionButton.setImage(UIImage(named: "favoriteicon_profile_24x24_"), forState: .Normal)
        
        collectionButton.setImage(UIImage(named: "favoriteicon_profile_press_24x24_"), forState: .Highlighted)
        collectionButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        return collectionButton
    }()
    
    /// 懒加载，创建夜间按钮
    private lazy var nightButton: YMVerticalButton = {
        let nightButton = YMVerticalButton()
        nightButton.setTitle("夜 间", forState: .Normal)
        nightButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        nightButton.addTarget(self, action: #selector(nightBtnClick(_:)), forControlEvents: .TouchUpInside)
        nightButton.setImage(UIImage(named: "nighticon_profile_24x24_"), forState: .Normal)
        
        nightButton.setImage(UIImage(named: "nighticon_profile_press_24x24_"), forState: .Highlighted)
        nightButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        return nightButton
    }()
    
    /// 懒加载，创建设置按钮
    private lazy var settingButton: YMVerticalButton = {
        let settingButton = YMVerticalButton()
        settingButton.setTitle("设 置", forState: .Normal)
        settingButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        settingButton.setImage(UIImage(named: "setupicon_profile_24x24_"), forState: .Normal)
        
        settingButton.setImage(UIImage(named: "setupicon_profile_press_24x24_"), forState: .Highlighted)
        settingButton.addTarget(self, action: #selector(settingBtnClick(_:)), forControlEvents: .TouchUpInside)
        settingButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        return settingButton
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionBtnClick(button: YMVerticalButton) {
        delegate?.headerBottomView(self, collectionButton: button)
    }
    
    func nightBtnClick(button: YMVerticalButton) {
        delegate?.headerBottomView(self, nightButton: button)
    }
    
    func settingBtnClick(button: YMVerticalButton) {
        delegate?.headerBottomView(self, settingButton: button)
    }
}
