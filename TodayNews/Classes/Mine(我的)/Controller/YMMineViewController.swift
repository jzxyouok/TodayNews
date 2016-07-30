//
//  YMMineViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/29.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit

let mineCellID = "YMMineCell"


class YMMineViewController: UITableViewController {
    
    var cells = [AnyObject]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 从 plist 加载数据
        loadCellFromPlist()
        // 设置 UI
        setupUI()
    }
    
    // 从 plist 加载数据
    private func loadCellFromPlist() {
        let path = NSBundle.mainBundle().pathForResource("YMMineCellPlist", ofType: "plist")
        let cellPlist = NSArray.init(contentsOfFile: path!)
        for arrayDict in cellPlist! {
            let array = arrayDict as! NSArray
            var sections = [AnyObject]()
            for dict in array {
                let cell = YMMineCellModel(dict: dict as! [String: AnyObject])
                sections.append(cell)
            }
            cells.append(sections)
        }
    }

    private func setupUI() {
        view.backgroundColor = YMGlobalColor()
        let nib = UINib(nibName: String(YMMineCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: mineCellID)
        tableView.tableHeaderView = headerView
        let footerView = UIView()
        footerView.height = kMargin
        tableView.tableFooterView = footerView
        tableView.rowHeight = kMineCellH
        tableView.separatorStyle = .None
    }
    
    /// 懒加载，创建 headerView
    private lazy var headerView: YMMineHeaderView = {
        let headerView = YMMineHeaderView.headerView()
        headerView.delegate = self
        headerView.bottomView.delegate = self
        return headerView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMMineViewController: YMMineHeaderViewDelegae, YMMineHeaderBottomViewDelegate {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - YMMineHeaderViewDelegae
    func headerView(headerView: YMMineHeaderView, headPhotoBbutton: YMMineHeaderIconButton) {
        print(#function)
    }
    
    // MARK: - YMMineHeaderBottomViewDelegate
    func headerBottomView(bottomView: YMMineHeaderBottomView,  collectionButton: YMVerticalButton) {
        print(#function)
    }
    
    func headerBottomView(bottomView: YMMineHeaderBottomView, nightButton: YMVerticalButton) {
        print(#function)
    }
    
    func headerBottomView(bottomView: YMMineHeaderBottomView, settingButton: YMVerticalButton) {
        print(#function)
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kMargin
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cells.count ?? 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellAyyay = cells[section] as! [YMMineCellModel]
        return cellAyyay.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(mineCellID) as! YMMineCell
        let cellArray = cells[indexPath.section] as! [YMMineCellModel]
        cell.cellModel = cellArray[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    // MARK: - UIScrollViewDelagate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            var tempFrame = headerView.bgImageView.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = kYMMineHeaderImageHeight - offsetY
            headerView.bgImageView.frame = tempFrame
        }
        
    }
}
