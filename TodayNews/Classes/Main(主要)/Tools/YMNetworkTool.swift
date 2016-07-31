//
//  YMNetworkTool.swift
//  TodayNews
//
//  Created by 杨蒙 on 16/7/30.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class YMNetworkTool: NSObject {
    /// 单例
    static let shareNetworkTool = YMNetworkTool()
    
    ///
    /// 获取首页顶部选择数据
//    func loadHomeTopData(finished:() -> ()) {
//        
//        let url = "http://lf.snssdk.com/concern/v1/concern/list/"
//        let params = ["version_code": "5.7.0",
//                      "app_name": "news_article",
//                      "vid": "8575CB9D-EFE0-411F-8E5C-DBB0D48D1948",
//                      "device_id": 6096495334,
//                      "channel": "App%20Store&resolution=750*1334",
//                      "aid": "13",
//                      "ab_version": "concern_talk_data_test10_09",
//                      "ab_feature": "z1",
//                      "openudid": "f1503767fe6a235142ac7ae604797c1093a40488",
//                      "live_sdk_version": "1.3.0",
//                      "idfv": "8575CB9D-EFE0-411F-8E5C-DBB0D48D1948",
//                      "ac": "WIFI",
//                      "os_version": "9.3.2",
//                      "ssmix": "a",
//                      "device_platform": "iphone",
//                      "iid": 4890731692,
//                      "ab_client": "a1,b2,b8,f2,f6,e1",
//                      "device_type": "iPhone%206",
//                      "idfa": "7D860ECF-C119-4A2D-9870-A9CCA1AD7CFA"]
//        
//        Alamofire
//            .request(.POST, url, parameters: params)
//            .responseJSON { (response) in
//                guard response.result.isSuccess else {
//                    SVProgressHUD.showErrorWithStatus("加载失败...")
//                    return
//                }
//                if let value = response.result.value {
//                    let dict = JSON(value)
//                    let code = dict["code"].intValue
//                    let message = dict["message"].stringValue
//                    guard code == RETURN_OK else {
//                        SVProgressHUD.showInfoWithStatus(message)
//                        return
//                    }
//                    SVProgressHUD.dismiss()
//                    let data = dict["data"].dictionary
//                    print(data)
////                    if let channels = data!["channels"]?.arrayObject {
////                        var ym_channels = [YMChannel]()
////                        for channel in channels {
////                            let ym_channel = YMChannel(dict: channel as! [String: AnyObject])
////                            ym_channels.append(ym_channel)
////                        }
////                        finished(ym_channels: ym_channels)
////                    }
//                }
//        }
//    }
    
}
