//
//  RegisterViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var userBtn: UIButton!
    @IBOutlet weak var tradesman: UIButton!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var phoneTrades: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var baomi1: UIButton!
    @IBOutlet weak var achieve: UIButton!
    
    var baomi = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        baomi = true
        
        phoneNum.delegate = self
        phoneTrades.delegate = self
        password.delegate = self
        
        achieve.setBackgroundImage(UIImage(named: "dianjihuoqu_selected.png"), forState: .Highlighted)
        registerBtn.setBackgroundImage(UIImage(named: "zhuce_selected.png"), forState: .Highlighted)
        
//        registerBtn.layer.cornerRadius = 25
//        userBtn.layer.borderColor = UIColor.whiteColor().CGColor
//        userBtn.layer.borderWidth = 1
//        tradesman.layer.borderColor = UIColor.whiteColor().CGColor
//        tradesman.layer.borderWidth = 1
        
    }
    @IBAction func backLogin(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func userMassage(sender: AnyObject) {
        print("用户")
        userBtn.setBackgroundImage(UIImage(named: "yonghu_normal.png"), forState: .Normal)
        tradesman.setBackgroundImage(UIImage(named: "shouyiren_dissable.png"), forState: .Normal)
    }
    
    @IBAction func tradesmanMassage(sender: AnyObject) {
        print("手艺人")
        tradesman.setBackgroundImage(UIImage(named: "shouyiren_selected.png"), forState: .Normal)
        userBtn.setBackgroundImage(UIImage(named: "yonghu_dissable.png"), forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func testGetCode(sender: AnyObject) {
        print("获取验证码")
        
        
    }
    
    @IBAction func passwordSafety(sender: AnyObject) {
        print("保密")
        if baomi==true {
            baomi1.setImage(UIImage(named: "ic_zhengyan.png"), forState: .Normal)
            baomi = false
        }else{
            baomi1.setImage(UIImage(named: "ic_biyan.png"), forState: .Normal)
            baomi = true
        }
    }
    
    @IBAction func registerUser(sender: AnyObject) {
        
        print("注册")
        
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        phoneNum.resignFirstResponder()
        phoneTrades.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
