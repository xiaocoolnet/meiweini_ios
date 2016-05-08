//
//  RechargeViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/8.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class RechargeViewController: UIViewController,UITextFieldDelegate {
    
    let nextBot = UIButton()
    let bankname = UILabel()
    let arr:[String] = ["充值金额","0钻石（兑换比例1:20）"]
    let money = UITextField()
    let jiantou = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "钻石充值"
        
        self.view.backgroundColor = RGREY
        
        for i in 0...1 {
            let backLab = UILabel(frame: CGRectMake(0, 15+CGFloat(i)*41, WIDTH, 40))
            backLab.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(backLab)
            
            let bankName = UILabel(frame: CGRectMake(10, 25+CGFloat(i)*41, 200, 20))
            bankName.text = arr[i]
            bankName.font = UIFont.systemFontOfSize(16)
            self.view.addSubview(bankName)
            
        }
        
        money.frame = CGRectMake(85, 20, 200, 30)
        money.font = UIFont.systemFontOfSize(16)
        money.placeholder = "当前余额99.99元"
        self.view.addSubview(money)
        money.delegate = self
        
        nextBot.frame = CGRectMake(20, 111, WIDTH-40, 44)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_pressed.png"), forState: .Normal)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_selected.png"), forState: .Highlighted)
        nextBot.addTarget(self, action: #selector(OneViewController.getHaveMoney), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextBot)
    }
    
    func getHaveMoney() {
        print("充值")
        self.view.endEditing(true)
        
        
    }
    
    func selectorBankCard() {
        print("银行卡")
        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        money.resignFirstResponder()
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
