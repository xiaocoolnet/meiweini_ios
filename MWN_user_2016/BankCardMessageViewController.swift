//
//  BankCardMessageViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BankCardMessageViewController: UIViewController,UITextFieldDelegate {

    let arr:[String] = ["卡类型","手机号"]
    let cardArr:[String] = ["选择银行卡类型","填写银行预留信息"]
    let ploder:[String] = ["姓名","请填写银行预留手机号"]
    let nextBot = UIButton()
    let nameField = UITextField()
    let phoneField = UITextField()
    let selector = UIButton()
    let agree = UILabel()
    let user = UIButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "填写银行卡信息"
        
        self.view.backgroundColor = RGREY
        
        for i in 0...1 {
            let backLab = UILabel(frame: CGRectMake(0, 30+CGFloat(i)*70, WIDTH, 40))
            backLab.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(backLab)
            
            let tit = UILabel(frame: CGRectMake(10, CGFloat(i)*70, 120, 30))
            tit.font = UIFont.systemFontOfSize(12)
            tit.textColor = UIColor.grayColor()
            tit.text = cardArr[i]
            self.view.addSubview(tit)
            
            let bankName = UILabel(frame: CGRectMake(10, 40+CGFloat(i)*70, 70, 20))
            bankName.text = arr[i]
            bankName.font = UIFont.systemFontOfSize(16)
            self.view.addSubview(bankName)
            
        }
        
        nameField.frame = CGRectMake(90, 35, 200, 30)
        nameField.font = UIFont.systemFontOfSize(16)
        nameField.placeholder = ploder[0]
        nameField.delegate = self
        self.view.addSubview(nameField)
        
        phoneField.frame = CGRectMake(90, 105, 200, 30)
        phoneField.font = UIFont.systemFontOfSize(16)
        phoneField.placeholder = ploder[1]
        phoneField.delegate = self
        self.view.addSubview(phoneField)
        
        selector.frame = CGRectMake(10, 150, 10, 10)
        selector.backgroundColor = UIColor.orangeColor()
        selector.addTarget(self, action: #selector(BankCardMessageViewController.selectTheMessage), forControlEvents: .TouchUpInside)
        self.view.addSubview(selector)
        agree.frame = CGRectMake(25, 140, 30, 30)
        agree.textAlignment = .Center
        agree.font = UIFont.systemFontOfSize(12)
        agree.textColor = UIColor.grayColor()
        agree.text = "同意"
        self.view.addSubview(agree)
        user.frame = CGRectMake(50, 140, 80, 30)
        user.titleLabel?.font = UIFont.systemFontOfSize(12)
        user.setTitle("《用户协议》", forState: .Normal)
        user.setTitle("", forState: .Highlighted)
        user.setTitleColor(UIColor.blueColor(), forState: .Normal)
        user.addTarget(self, action: #selector(BankCardMessageViewController.userMessage), forControlEvents: .TouchUpInside)
        self.view.addSubview(user)
        
        nextBot.frame = CGRectMake(20, 170, WIDTH-40, 44)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_pressed.png"), forState: .Normal)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_selected.png"), forState: .Highlighted)
        nextBot.addTarget(self, action: #selector(BankCardMessageViewController.nextGoView), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextBot)
        
        // Do any additional setup after loading the view.
    }

    func selectTheMessage() {
        print("选择")
        nameField.resignFirstResponder()
        phoneField.resignFirstResponder()
        
    }
    func userMessage() {
        print("用户协议")
        nameField.resignFirstResponder()
        phoneField.resignFirstResponder()

        
    }
    func nextGoView() {
        print("下一步")
        nameField.resignFirstResponder()
        phoneField.resignFirstResponder()
        

    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        nameField.resignFirstResponder()
        phoneField.resignFirstResponder()
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
