//
//  ModelViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {

    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "模特主页"
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        // Do any additional setup after loading the view.
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
