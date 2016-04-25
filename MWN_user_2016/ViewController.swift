//
//  ViewController.swift
//  MWN_user_2016
//
//  Created by zhang on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var forgetPassword: UIButton!
    @IBOutlet weak var registerBtn: UIButton!    
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        phoneNum.delegate = self
        password.delegate = self
        
        loginBtn.setBackgroundImage(UIImage(named: "denglu_pressed.png"), forState: .Highlighted)
        
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GoTablebar(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainView")
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func qqLogin(sender: AnyObject) {
        print("QQ登录")
        
        
    }
    
    @IBAction func sinaLogin(sender: AnyObject) {
        print("新浪登录")
        
    }
    
    @IBAction func weixinLogin(sender: AnyObject) {
        print("微信登录")
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        phoneNum.resignFirstResponder()
        password.resignFirstResponder()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

