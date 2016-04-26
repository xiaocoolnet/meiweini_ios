//
//  UserMassageViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class UserMassageViewController: UIViewController,UITextFieldDelegate {

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
        self.view.backgroundColor = UIColor.whiteColor()
        
        let rightBtn = UIBarButtonItem(title: "保存", style: .Done, target: self, action: #selector(UserMassageViewController.saveThisMassage))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        userImage.frame = CGRectMake(WIDTH/2-60, 40, 100, 100)
        userImage.layer.cornerRadius = 50
        userImage.clipsToBounds = true
        userImage.setImage(UIImage(named: "kb3.png"), forState: .Normal)
        
        for i in 0...2 {
            let line = UILabel()
            line.frame = CGRectMake(10, 260+CGFloat(i)*70, WIDTH-20, 1)
            line.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
            
            self.view.addSubview(line)
            
        }
        userName.frame = CGRectMake(10, 230, 60, 30)
        userName.text = "昵称"
        sex.frame = CGRectMake(10, 300, 60, 30)
        sex.text = "性别"
        phone.frame = CGRectMake(10, 370, 60, 30)
        phone.text = "手机号"
        name.frame = CGRectMake(100, 230, WIDTH/2, 30)
        name.textAlignment = .Center
        name.textColor = UIColor(red: 174/255.0, green: 179/255.0, blue: 190/255.0, alpha: 1.0)
        name.text = "风吹枫落"
        name.placeholder = "请输入昵称"
        phoneNum.frame = CGRectMake(100, 370, WIDTH/2, 30)
        phoneNum.textAlignment = .Center
        phoneNum.textColor = UIColor(red: 174/255.0, green: 179/255.0, blue: 190/255.0, alpha: 1.0)
        phoneNum.text = "1327848437"
        phoneNum.placeholder = "请输入手机号码"
        clean.frame = CGRectMake(WIDTH-40, 230, 30, 30)
        clean.setImage(UIImage(named: "ic_guangbi.png"), forState: .Normal)
        clean.addTarget(self, action: #selector(UserMassageViewController.cleanTheText), forControlEvents: .TouchUpInside)
        lady.frame = CGRectMake(WIDTH/3-10, 300, 30, 30)
        lady.text = "女"
        lady.textAlignment = .Center
        wemen.frame = CGRectMake(WIDTH/3+20, 300, 30, 30)
        wemen.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        wemen.addTarget(self, action: #selector(UserMassageViewController.manGetWeman), forControlEvents: .TouchUpInside)
        men.frame = CGRectMake(WIDTH/3*2-20, 300, 30, 30)
        men.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
        men.addTarget(self, action: #selector(UserMassageViewController.wemanGetMan), forControlEvents: .TouchUpInside)
        male.frame = CGRectMake(WIDTH/3*2-50, 300, 30, 30)
        male.text = "男"
        male.textAlignment = .Center
        
        self.view.addSubview(lady)
        self.view.addSubview(male)
        self.view.addSubview(clean)
        self.view.addSubview(phoneNum)
        self.view.addSubview(name)
        self.view.addSubview(sex)
        self.view.addSubview(phone)
        self.view.addSubview(userName)
        self.view.addSubview(userImage)
        self.view.addSubview(men)
        self.view.addSubview(wemen)
        
        name.delegate = self
        phoneNum.delegate = self
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        phoneNum.resignFirstResponder()
        name.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func cleanTheText() {
        print("清除")
        name.text = ""
    }
    func manGetWeman() {
        print("女")
        men.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        wemen.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
    }
    func wemanGetMan() {
        print("男")
        men.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
        wemen.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
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
