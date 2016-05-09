//
//  OneViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class OneViewController: UIViewController,UITextFieldDelegate {

    let nextBot = UIButton()
    let bankname = UILabel()
    let arr:[String] = ["银行卡","充值金额"]
    let money = UITextField()
    let jiantou = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "账户充值"
        
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
        jiantou.addTarget(self, action: #selector(OneViewController.selectorBankCard), forControlEvents: .TouchUpInside)
        self.view.addSubview(jiantou)
        
        money.frame = CGRectMake(WIDTH-150, 61, 140, 30)
        money.font = UIFont.systemFontOfSize(16)
        money.placeholder = "输入金额"
        money.textAlignment = .Right
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
        money.resignFirstResponder()
        
        
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
