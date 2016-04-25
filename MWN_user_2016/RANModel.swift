//
//  RANModel.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class RANModel: NSObject {

    var img : NSString?
//    var price : NSString?
    var h : NSString?
    var w : NSString?
    
    func initWithDict(dict : NSDictionary)->Self{
        self.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
        return self
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}
