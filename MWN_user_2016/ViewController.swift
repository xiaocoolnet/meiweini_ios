//
//  ViewController.swift
//  MWN_user_2016
//
//  Created by zhang on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

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
        if(phoneNum.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入手机号"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return
        }
        if(password.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return
        }
        let url = mwnUrl+"applogin"
        let param = [
            "phone":phoneNum.text!,
            "password":password.text!
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("response是")
                print(response!)
                print("data是")
                print(json!)
                print("====================")
                let status = Httpresult(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(status.status == "success"){
                    print("Success")
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.labelText = "登录成功"
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                    let userid = NSUserDefaults.standardUserDefaults()
                    userid.setValue(status.data?.id, forKey: "userid")
                    let schoolid = NSUserDefaults.standardUserDefaults()
                    schoolid.setValue(status.data?.schoolid, forKey: "schoolid")
                    let classid = NSUserDefaults.standardUserDefaults()
                    classid.setValue(status.data?.classid, forKey: "classid")
                    self.GetUserInfo()
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainView")
                    self.presentViewController(vc, animated: true, completion: nil)
                }
            }
        }
    }
    func GetUserInfo(){
        let userid = NSUserDefaults.standardUserDefaults()
        let uid = userid.stringForKey("userid")
        let url = mwnUrl+"getuserinfo"
        let param = [
            "userid":uid!
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
                print("====================")
                let status = LoginModel(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(status.status == "success"){
                    print("Success")
                    let username = NSUserDefaults.standardUserDefaults()
                    username.setValue(status.data?.name, forKey: "username")
                }
            }
        }
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
    @IBAction func businessGoTo(sender: AnyObject) {
        print("商家")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Business")
        self.presentViewController(vc, animated: true, completion: nil)
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        phoneNum.resignFirstResponder()
        password.resignFirstResponder()
        self.view.endEditing(true)

    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

