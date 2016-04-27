//
//  MineAccountViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineAccountViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我的账户"
        self.view.backgroundColor = RGREY
        
        let rightBtn = UIBarButtonItem(image: UIImage(named: "菜单图标.png"), style: .Done, target: self, action: #selector(MineAccountViewController.accountTheView))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        
        // Do any additional setup after loading the view.
    }

    func accountTheView() {
        print("列表")
        
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
