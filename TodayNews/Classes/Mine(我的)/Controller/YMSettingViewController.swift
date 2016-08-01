//
//  YMSettingViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let settingCellID = "settingCellID"

class YMSettingViewController: YMBaseViewController {

    var tableView: UITableView?
    
    var settings = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSettingFromPlist()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = YMGlobalColor()
        let tableView = UITableView(frame: view.bounds, style: .Grouped)
        let nib = UINib(nibName: String(YMSettingCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: settingCellID)
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 65
        tableView.separatorStyle = .None
        tableView.sectionFooterHeight = 0.1 // 默认是0
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView = tableView
    }

    // 从 plist 加载数据
    private func loadSettingFromPlist() {
        let path = NSBundle.mainBundle().pathForResource("YMSettingPlist", ofType: "plist")
        let cellPlist = NSArray.init(contentsOfFile: path!)
        for arrayDict in cellPlist! {
            let array = arrayDict as! NSArray
            var sections = [AnyObject]()
            for dict in array {
                let cell = YMSettingModel(dict: dict as! [String: AnyObject])
                sections.append(cell)
            }
            settings.append(sections)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /// 设置字体大小
    private func setupFontAlertController() {
        let alertController = UIAlertController(title: "设置字体大小", message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let smallAction = UIAlertAction(title: "小", style: .Default, handler: { (_) in
            
        })
        let middleAction = UIAlertAction(title: "中", style: .Default, handler: { (_) in
            
        })
        let bigAction = UIAlertAction(title: "大", style: .Default, handler: { (_) in
            
        })
        let largeAction = UIAlertAction(title: "特大", style: .Default, handler: { (_) in
            
        })
        alertController.addAction(cancelAction)
        alertController.addAction(smallAction)
        alertController.addAction(middleAction)
        alertController.addAction(bigAction)
        alertController.addAction(largeAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    // 非 wifi 网络流量
    private func setupNetworkAlertController() {
        let alertController = UIAlertController(title: "非Wifi网络流量", message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let bestFlowAction = UIAlertAction(title: "最佳效果（下载大图）", style: .Default, handler: { (_) in
            
        })
        let betterFlowAction = UIAlertAction(title: "较省流量（智能下图）", style: .Default, handler: { (_) in
            
        })
        let leastFlowAction = UIAlertAction(title: "极省流量（不下载图）", style: .Default, handler: { (_) in
            
        })
        alertController.addAction(cancelAction)
        alertController.addAction(bestFlowAction)
        alertController.addAction(betterFlowAction)
        alertController.addAction(leastFlowAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    /// 清除缓存
    private func clearCacheAlertController() {
        let alertController = UIAlertController(title: "确定清除所有缓存？问答草稿、离线内容及图片均会被清除", message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .Default, handler: { (_) in
            
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    /// 头部 view
    private lazy var headerView: YMSettingHeaderView = {
        let headerView = YMSettingHeaderView.settingHeaderView()
        headerView.delegate = self
        return headerView
    }()

}

extension YMSettingViewController: UITableViewDelegate, UITableViewDataSource, YMSettingHeaderViewDelegate {
    
    // MARK: - YMSettingHeaderViewDelegate
    func settingHeaderView(headerView: YMSettingHeaderView, accountManageButton: UIButton) {
        
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return settings.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let setting = settings[section] as! [YMSettingModel]
        return setting.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(settingCellID) as! YMSettingCell
        let cellArray = settings[indexPath.section] as! [YMSettingModel]
        cell.setting = cellArray[indexPath.row]
        if indexPath.section == 4 {
            if indexPath.row == 1 {
                cell.selectionStyle = .None
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kMargin
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 0 {
            let accountManageVC = YMAccountManageController()
            accountManageVC.title = "账号管理"
            navigationController?.pushViewController(accountManageVC, animated: true)
        }
        
        if indexPath.section == 1 {
            if indexPath.row == 1 {
                // 设置字体大小
                setupFontAlertController()
            }
        }
        
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                // 网络流量
                setupNetworkAlertController()
            } else if indexPath.row == 1 {
                // 清除缓存
                clearCacheAlertController()
            }
        }
        
        if indexPath.section == 3 {
            if indexPath.row == 2 {
                let autoPlayVideoVC = YMAutoPlayVideoController()
                autoPlayVideoVC.title = "自动播放视频"
                navigationController?.pushViewController(autoPlayVideoVC, animated: true)
            }
        }
        
        if indexPath.section == 4 {
            
        }
    }
}
