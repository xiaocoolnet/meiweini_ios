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
//                    
                    let userid = NSUserDefaults.standardUserDefaults()
                    userid.setValue(status.data?.id, forKey: "userid")
                    
//                    self.GetUserInfo()
                    
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
                    let phoneNumber = NSUserDefaults.standardUserDefaults()
                    phoneNumber.setValue(status.data?.phoneNumber, forKey: "phoneNumber")
                }
            }
        }
    }

    @IBAction func qqLogin(sender: AnyObject) {
        print("QQ登录")
        
        
    }
    
    @IBAction func sinaLogin(sender: AnyObject) {
        print("新浪登录")
        
        let snsPlatform: UMSocialSnsPlatform = UMSocialSnsPlatformManager.getSocialPlatformWithName(UMShareToSina)
        
        snsPlatform.loginClickHandler(self, UMSocialControllerService.defaultControllerService(), true, {response in
            
            if response.responseCode == UMSResponseCodeSuccess {
                
                let snsAccount:UMSocialAccountEntity = UMSocialAccountManager.socialAccountDictionary()[UMShareToSina] as! UMSocialAccountEntity
                
                print("username is \(snsAccount.userName), uid is \(snsAccount.usid), token is \(snsAccount.accessToken) url is \(snsAccount.iconURL)")
                
//               登录成功后跳转
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainView")
                self.presentViewController(vc, animated: true, completion: nil)
            }
        })
        
        //获取accestoken以及新浪用户信息，得到的数据在回调Block对象形参respone的data属性
        UMSocialDataService.defaultDataService().requestSnsInformation(UMShareToSina) { (response) -> Void in
            print("------\(response.data)")
        }
        
    }
    
    @IBAction func weixinLogin(sender: AnyObject) {
        print("微信登录")
        
        let snsPlatform: UMSocialSnsPlatform = UMSocialSnsPlatformManager.getSocialPlatformWithName(UMShareToWechatSession)
        
        snsPlatform.loginClickHandler(self, UMSocialControllerService.defaultControllerService(), true, {response in
            
            if response.responseCode == UMSResponseCodeSuccess {
                
                let snsAccount:UMSocialAccountEntity = UMSocialAccountManager.socialAccountDictionary()[UMShareToWechatSession] as! UMSocialAccountEntity
                
                print("username is \(snsAccount.userName), uid is \(snsAccount.usid), token is \(snsAccount.accessToken) url is \(snsAccount.iconURL)")
                
                //               登录成功后跳转
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainView")
                self.presentViewController(vc, animated: true, completion: nil)
            }
        })
        
        //获取accestoken以及新浪用户信息，得到的数据在回调Block对象形参respone的data属性
        UMSocialDataService.defaultDataService().requestSnsInformation(UMShareToWechatSession) { (response) -> Void in
            print("------\(response.data)")
        }
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

