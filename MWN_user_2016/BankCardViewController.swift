//
//  BankCardViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BankCardViewController: UIViewController,UITextFieldDelegate {

    let nextBot = UIButton()
    let arr:[String] = ["持卡人","卡号"]
    let cardMan = UITextField()
    let money = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "添加银行卡"
        
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
        
        cardMan.frame = CGRectMake(80, 20, 200, 30)
        cardMan.font = UIFont.systemFontOfSize(16)
        cardMan.placeholder = "姓名"
        self.view.addSubview(cardMan)
        cardMan.delegate = self
        
        money.delegate = self
        money.frame = CGRectMake(80, 61, 200, 30)
        money.font = UIFont.systemFontOfSize(16)
        money.placeholder = "银行卡号"
        self.view.addSubview(money)
        money.delegate = self
        
        nextBot.frame = CGRectMake(20, 111, WIDTH-40, 44)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_pressed.png"), forState: .Normal)
        nextBot.setBackgroundImage(UIImage(named: "xiaoyibu_selected.png"), forState: .Highlighted)
        nextBot.addTarget(self, action: #selector(BankCardViewController.getNextView), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextBot)
    }
    
    func getNextView() {
        print("下一页")
        money.resignFirstResponder()
        cardMan.resignFirstResponder()
        
        let next = TestPhoneNumViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        money.resignFirstResponder()
        cardMan.resignFirstResponder()
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
