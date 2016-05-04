//
//  PasswordViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class PasswordViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    @IBOutlet weak var overBtn: UIButton!
    @IBOutlet weak var baomi1: UIButton!
    @IBOutlet weak var baomi2: UIButton!
    
    var code:String?
    
    var baomi = Bool()
    var baomiTwo = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        baomi = true
        baomiTwo = true
        
        phoneNum.delegate = self
        password.delegate = self
        passwordAgain.delegate = self
        
        overBtn.userInteractionEnabled = false
        baomi2.userInteractionEnabled = false
        baomi1.userInteractionEnabled = false
        
        overBtn.setBackgroundImage(UIImage(named: "wanchenganniu_selected.png"), forState: .Highlighted)
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("编辑")
        
        overBtn.setBackgroundImage(UIImage(named: "wanchenganniu_pressed.png"), forState: .Normal)
        overBtn.userInteractionEnabled = true
        baomi1.userInteractionEnabled = true
        baomi2.userInteractionEnabled = true
    }
    
    @IBAction func passwordSafety(sender: AnyObject) {
        print("保密")
        if baomi==true {
            baomi1.setImage(UIImage(named: "ic_biyan.png"), forState: .Normal)
            password.secureTextEntry = true
            baomi = false
        }else{
            baomi1.setImage(UIImage(named: "ic_zhengyan.png"), forState: .Normal)
            password.secureTextEntry = false
            baomi = true
        }
        
    }
    @IBAction func passwordSafetyTwo(sender: AnyObject) {
        print("保密")
        if baomiTwo==true {
            baomi2.setImage(UIImage(named: "ic_zhengyan.png"), forState: .Normal)
            passwordAgain.secureTextEntry = false
            baomiTwo = false
        }else{
            baomi2.setImage(UIImage(named: "ic_biyan.png"), forState: .Normal)
            passwordAgain.secureTextEntry = true
            baomiTwo = true
        }
    }
    
    func UpdatePassword(){
        
        let url = mwnUrl+"forgetpwd"
        let param = [
            "phone":phoneNum.text!,
            "password":passwordAgain.text!,
            "code":code!
        ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
                print("request是")
                print(request!)
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
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = "修改成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                    self.navigationController?.popToRootViewControllerAnimated(true)
                }
            }
        }
    }

    func PanKong()->Bool{
        if(phoneNum.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入手机号"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        if(password.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        if(passwordAgain.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请再次输入密码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        if(password.text! != passwordAgain.text!){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "两次密码不正确"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        return true
    }
    
    @IBAction func overPassword(sender: AnyObject) {
        print("完成")
        
        if (phoneNum.text!.isEmpty||phoneNum.text?.characters.count != 11)
        {
            let alerView:UIAlertView = UIAlertView()
            alerView.title = "手机号输入错误"
            alerView.message = "请重新输入"
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 1
            alerView.show()
            
        }else{
            if PanKong() == true{
                UpdatePassword()
                let alertController = UIAlertController(title: NSLocalizedString("", comment: "Warn"), message: NSLocalizedString("确认修改？", comment: "empty message"), preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
                let doneAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                    //            let userid = NSUserDefaults.standardUserDefaults()
                    //            userid.setValue("", forKey: "userid")
                    //            let defalutid = NSUserDefaults.standardUserDefaults()
                    //            defalutid.setValue("", forKey: "cid")
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginView") as! UINavigationController
                    self.presentViewController(vc, animated: true, completion: nil)
                }
                alertController.addAction(doneAction)
                alertController.addAction(cancelAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                
                
            }
            
        }
  
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        phoneNum.resignFirstResponder()
        password.resignFirstResponder()
        passwordAgain.resignFirstResponder()
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
