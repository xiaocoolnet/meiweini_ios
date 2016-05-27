//
//  RegisterViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class RegisterViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var userBtn: UIButton!
    @IBOutlet weak var tradesman: UIButton!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var phoneTrades: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var baomi1: UIButton!
    @IBOutlet weak var achieve: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var registerBus: UIButton!
    
    var timeNamal:NSTimer!
    var timeNow:NSTimer!
    var count:Int = 60
//    var alerView0:UIAlertView!
//    var alerView1:UIAlertView!
//    var alerView2:UIAlertView!
//    var alerView3:UIAlertView!
//    var alerView4:UIAlertView!
    
    var baomi = Bool()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=true
        timeLabel.hidden = true
        registerBus.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        baomi = true
        
        phoneNum.delegate = self
        phoneTrades.delegate = self
        password.delegate = self
        password.secureTextEntry = true
        
        achieve.setBackgroundImage(UIImage(named: "dianjihuoqu_selected.png"), forState: .Highlighted)
        registerBtn.setBackgroundImage(UIImage(named: "zhuce_selected.png"), forState: .Highlighted)
        
    }
    @IBAction func backLogin(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func userMassage(sender: AnyObject) {
        print("用户")
        userBtn.setBackgroundImage(UIImage(named: "yonghu_normal.png"), forState: .Normal)
        tradesman.setBackgroundImage(UIImage(named: "shouyiren_dissable.png"), forState: .Normal)
        registerBus.hidden = true
        registerBtn.hidden = false
    }
    
    @IBAction func tradesmanMassage(sender: AnyObject) {
        print("手艺人")
        tradesman.setBackgroundImage(UIImage(named: "shouyiren_selected.png"), forState: .Normal)
        userBtn.setBackgroundImage(UIImage(named: "yonghu_dissable.png"), forState: .Normal)
        registerBus.hidden = false
        registerBtn.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func testGetCode(sender: AnyObject) {
        print("获取验证码")
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
            
        }
        else
        {
            let alerView:UIAlertView = UIAlertView()
            alerView.title = "发送验证码到"
            alerView.message = "\(phoneNum.text!)"
            alerView.addButtonWithTitle("取消")
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 0
            alerView.show()
        }
        
    }
    
    @IBAction func passwordSafety(sender: AnyObject) {
        print("保密")
        if baomi==true {
            baomi1.setImage(UIImage(named: "ic_zhengyan.png"), forState: .Normal)
            password.secureTextEntry = false
            baomi = false
        }else{
            baomi1.setImage(UIImage(named: "ic_biyan.png"), forState: .Normal)
            password.secureTextEntry = true
            baomi = true
        }
    }
    
    @IBAction func registerBusiness(sender: AnyObject) {
        print("注册商户")
        
        
        
    }
    @IBAction func registerUser(sender: AnyObject) {
        
        print("注册")
        if PandKong()==true{
            RegisterYanZheng()
        }
    }
   
    func RegisterYanZheng(){
        let url = mwnUrl+"AppRegister"
        let param = [
            "phone":phoneNum.text!,
            "code":phoneTrades.text!,
            "password":password.text!,
            "devicestate": 1
        ]
        print(url)
        Alamofire.request(.GET, url, parameters: param as? [String : AnyObject]).response { request, response, json, error in
            if(error != nil){
            }
            else{
               
                let status = Httpresult(JSONDecoder(json!))
                print(JSONDecoder(json!))
                print("状态是")
                print(status.status)
                if(status.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = status.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 3)
                }
                if(status.status == "success"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text;
                    hud.labelText = "注册成功"
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                    self.navigationController?.popToRootViewControllerAnimated(true)
                    
                }
            }
        }
    }
    func PandKong()->Bool{
        if(phoneNum.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入手机号"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        if(phoneTrades.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入验证码"
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
        return true
    }
    
    

    func timeDow()
    {
        let time1 = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: #selector(RegisterViewController.updateTime), userInfo: nil, repeats: true)
        timeNow = time1
    }
    
    func showRepeatButton()
    {
        timeLabel.hidden=true
        achieve.hidden = false
        achieve.enabled = true
    }
    
    func updateTime()
    {
        count -= 1
        if (count <= 0)
        {
            count = 60
            self.showRepeatButton()
            timeNow.invalidate()
        }
        timeLabel.text = "\(count)S"
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.tag == 0
        {
            if buttonIndex == 1
            {
                self.senderMessage()
                achieve.hidden = true
                timeLabel.hidden = false
                self.timeDow()
            }
        }
        if alertView.tag == 1
        {}
        if alertView.tag == 2
        {}
    }
    
    func senderMessage()
    {
        let url = mwnUrl+"SendMobileCode"
        let param = [
            "phone":phoneNum.text!,
            ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
            }
        }
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
