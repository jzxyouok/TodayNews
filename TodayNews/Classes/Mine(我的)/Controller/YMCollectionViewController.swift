//
//  YMCollectionViewController.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//
//  收藏界面
//

import UIKit

class YMCollectionViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func setupUI() {
        view.backgroundColor = YMGlobalColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: .Plain, target: self, action: #selector(editBBItemClick))
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YMCollectionViewController {
    
    func editBBItemClick() {
        print(#function)
    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let setting = settings[section] as! [YMMineCellModel]
//        return setting.count ?? 0
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier(mineCellID) as! YMMineCell
//        let cellArray = settings[indexPath.section] as! [YMMineCellModel]
//        cell.cellModel = cellArray[indexPath.row]
//        return cell
//    }
//    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        
//    }
}
