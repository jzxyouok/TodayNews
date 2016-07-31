//
//  YMNewCareViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  关注界面
//

import UIKit

let newCareTopCellID = "YMNewCareTopCell"
let newCareBottomCellID = "YMNewCareBottomCell"

class YMNewCareViewController: YMBaseViewController {

    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置 UI
        setupUI()
        
        
    }
    
    // 设置 UI
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search_topic_24x24_"), style: .Plain, target: self, action: #selector(searchBBItemClick))
        let tableView = UITableView(frame: view.bounds, style: .Grouped)
        let topNib = UINib(nibName: String(YMNewCareTopCell), bundle: nil)
        tableView.registerNib(topNib, forCellReuseIdentifier: newCareTopCellID)
        let bottomNib = UINib(nibName: String(YMNewCareBottomCell), bundle: nil)
        tableView.registerNib(bottomNib, forCellReuseIdentifier: newCareBottomCellID)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 67
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        tableView.sectionFooterHeight = kMargin
        view.addSubview(tableView)
        self.tableView = tableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBBItemClick() {
        print(#function)
    }
}

extension YMNewCareViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 { // 正在关心
            let cell = tableView.dequeueReusableCellWithIdentifier(newCareTopCellID) as! YMNewCareTopCell
            
            return cell
        } else { // 可能关心
            let cell = tableView.dequeueReusableCellWithIdentifier(newCareBottomCellID) as! YMNewCareBottomCell
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = YMCareheaderView()
        if section == 0 {
            headerView.title = "正在关心"
            return headerView
        } else {
            headerView.title = "可能关心"
            return headerView
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
