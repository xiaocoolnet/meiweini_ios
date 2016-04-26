//
//  UserMassageViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class UserMassageViewController: UIViewController {

    var userImage = UIButton()
    let userName = UILabel()
    var name = UITextField()
    var wemen = UIButton()
    var men = UIButton()
    let sex = UILabel()
    let lady = UILabel()
    let male = UILabel()
    let phone = UILabel()
    var phoneNum = UITextField()
    var clean = UIButton()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = RGREY
        
        let rightBtn = UIBarButtonItem(title: "保存", style: .Done, target: self, action: #selector(UserMassageViewController.saveThisMassage))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        userImage.frame = CGRectMake(WIDTH/2-60, 40, 120, 120)
        userImage.layer.cornerRadius = 60
        userImage.clipsToBounds = true
        userImage.setImage(UIImage(named: "kb3.png"), forState: .Normal)
        
        self.view.addSubview(userImage)
        
    }

    func saveThisMassage() {
        print("保存")
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
