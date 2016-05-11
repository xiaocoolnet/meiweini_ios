//
//  TransactionViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import PagingMenuController

class TransactionViewController: UIViewController {

    let oneView = BalanceOfPaymentViewController()
    let twoView = WithdrawMoneyViewController()
    
    var nameArr:[String] = ["收支明细","提现记录"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "账单"
        self.view.backgroundColor = RGREY
        
        oneView.title = nameArr[0]
        twoView.title = nameArr[1]
        
        let viewControllers = [oneView,twoView]
        let options = PagingMenuOptions()
        options.menuItemMargin = 5
        options.menuHeight = 40
        
        options.menuDisplayMode = .SegmentedControl
        //options.menuDisplayMode = .Infinite(widthMode: .Fixed(width: WIDTH/4))
        //options.selectedBackgroundColor = UIColor(red: 1, green: 112/255.0, blue: 92/255.0, alpha: 1.0)
        //options.selectedTextColor = UIColor.blackColor()
        options.menuItemMode = .Underline(height: 3, color: UIColor(red: 1, green: 95/255.0, blue: 73/255.0, alpha: 1.0), horizontalPadding: 0, verticalPadding: 0)
        let pagingMenuController = PagingMenuController(viewControllers: viewControllers, options: options)
        pagingMenuController.view.frame.origin.y += 0
        pagingMenuController.view.frame.size.height -= 0
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMoveToParentViewController(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
