//
//  TCUserInfo.swift
//  Parking
//
//  Created by xiaocool on 16/5/11.
//  Copyright © 2016年 北京校酷网络科技有限公司. All rights reserved.
//

import UIKit

class TCUserInfo {
    var photo:String = ""
    var phone:String = ""
    var id:String = ""
    var name:String = ""
    var usertype:String = ""
    var city:String = ""
    var time:String = ""
   
    
    static let currentInfo = TCUserInfo()
    private init() {
        
    }
}
