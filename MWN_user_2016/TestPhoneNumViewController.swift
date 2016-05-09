//
//  TestPhoneNumViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TestPhoneNumViewController: UIViewController,UITextFieldDelegate {

    let back = UILabel()
    let tit = UILabel()
    let line = UILabel()
    let testNum = UIButton()
    let nextBot = UIButton()
    let testField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "验证手机号"
        
        self.view.backgroundColor = RGREY
        let phone = NSUserDefaults.standardUserDefaults()
        let phoneNum = phone.stringForKey("phoneNumber")
        print(phoneNum)
        
        back.frame = CGRectMake(0, 15, WIDTH, 90)
        back.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(back)
        
        tit.frame = CGRectMake(10, 20, WIDTH-20, 50)
        tit.font = UIFont.systemFontOfSize(15)
        tit.numberOfLines = 0
        tit.text = "绑定银行卡需要手机验证，请输入手机"+phoneNum!+"收到的短信验证码"
        self.view.addSubview(tit)
        
        line.frame = CGRectMake(10, 95.5, WIDTH-170, 0.5)
        line.backgroundColor = UIColor(red: 244/255.0, green: 81/255.0, blue: 31/255.0, alpha: 1.0)
        self.view.addSubview(line)
        
        testField.frame = CGRectMake(10, 65, WIDTH-170, 30)
        testField.font = UIFont.systemFontOfSize(15)
        testField.textAlignment = .Center
        self.view.addSubview(testField)
        testField.delegate = self
        
        testNum.frame = CGRectMake(WIDTH-140, 66, 130, 30)
        testNum.layer.cornerRadius = 5
        testNum.backgroundColor = UIColor(red: 244/255.0, green: 81/255.0, blue: 31/255.0, alpha: 1.0)
        testNum.titleLabel?.font = UIFont.systemFontOfSize(15)
        testNum.setTitle("重新获取验证码", forState: .Normal)
        testNum.setTitle("", forState: .Highlighted)
        testNum.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        testNum.addTarget(self, action: #selector(TestPhoneNumViewController.getHaveTest), forControlEvents: .TouchUpInside)
        self.view.addSubview(testNum)
        
        nextBot.frame = CGRectMake(20, 150, WIDTH-40, 44)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_pressed.png"), forState: .Normal)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_selected.png"), forState: .Highlighted)
        nextBot.addTarget(self, action: #selector(TestPhoneNumViewController.goBankCardMessage), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextBot)
        
        // Do any additional setup after loading the view.
    }

    func getHaveTest() {
        testField.resignFirstResponder()
        print("重新获取验证码")
        
        
    }
    func goBankCardMessage() {
        testField.resignFirstResponder()
        print("银行卡信息")
        let next = BankCardMessageViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        testField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
