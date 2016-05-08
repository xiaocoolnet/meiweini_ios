//
//  WithdrawViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/8.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class WithdrawViewController: UIViewController,UITextFieldDelegate {
    
    let nextBot = UIButton()
    let bankname = UILabel()
    let arr:[String] = ["银行卡","提现金额"]
    let money = UITextField()
    let jiantou = UIButton()
    let tit = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "账户提现"
        
        self.view.backgroundColor = RGREY
        
        for i in 0...1 {
            let backLab = UILabel(frame: CGRectMake(0, 15+CGFloat(i)*41, WIDTH, 40))
            backLab.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(backLab)
            
            let bankName = UILabel(frame: CGRectMake(10, 25+CGFloat(i)*41, 70, 20))
            bankName.text = arr[i]
            bankName.font = UIFont.systemFontOfSize(16)
            self.view.addSubview(bankName)
            
        }
        bankname.frame = CGRectMake(WIDTH/2, 25, WIDTH/2-40, 20)
        bankname.font = UIFont.systemFontOfSize(16)
        bankname.textAlignment = .Right
        bankname.text = "建设银行储蓄卡(0033)"
        self.view.addSubview(bankname)
        
        jiantou.frame = CGRectMake(WIDTH-35, 25, 25, 20)
        jiantou.backgroundColor = UIColor.orangeColor()
        jiantou.addTarget(self, action: #selector(WithdrawViewController.selectorBankCard), forControlEvents: .TouchUpInside)
        self.view.addSubview(jiantou)
        
        money.frame = CGRectMake(WIDTH-150, 61, 140, 30)
        money.font = UIFont.systemFontOfSize(16)
        money.placeholder = "可转出金额999.00"
        money.textAlignment = .Right
        self.view.addSubview(money)
        money.delegate = self
        
        tit.frame = CGRectMake(10, 104, 50, 20)
        tit.font = UIFont.systemFontOfSize(12)
        tit.textColor = UIColor.grayColor()
        tit.text = "当天到帐"
        self.view.addSubview(tit)
        
        nextBot.frame = CGRectMake(20, 132, WIDTH-40, 44)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_pressed.png"), forState: .Normal)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_selected.png"), forState: .Highlighted)
        nextBot.addTarget(self, action: #selector(WithdrawViewController.getHaveMoney), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextBot)
    }
    
    func getHaveMoney() {
        print("提现")
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
