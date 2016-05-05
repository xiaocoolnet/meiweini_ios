//
//  VerificationViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class VerificationViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var verification: UIButton!
    @IBOutlet weak var verityField: UITextField!
    @IBOutlet weak var phoneNUm: UILabel!

    @IBOutlet weak var nextBtn: UIButton!
    var phoneNum:String?
    
    var timeNamal:NSTimer!
    var timeNow:NSTimer!
    var count:Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()

        verityField.delegate = self
        nextBtn.userInteractionEnabled = false
        phoneNUm.text = "+86 "+phoneNum!
        
        nextBtn.setBackgroundImage(UIImage(named: "xiaoyibu_selected.png"), forState: .Highlighted)
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("编辑")
        
        nextBtn.setBackgroundImage(UIImage(named: "xiaoyibu_pressed.png"), forState: .Normal)
        nextBtn.userInteractionEnabled = true
    }
    
    @IBAction func GetVerifiction(sender: AnyObject) {
        print("获取验证码")
        let alerView:UIAlertView = UIAlertView()
        alerView.title = "发送验证码到"
        alerView.message = "\(phoneNum!)"
        alerView.addButtonWithTitle("取消")
        alerView.addButtonWithTitle("确定")
        alerView.cancelButtonIndex = 0
        alerView.delegate = self
        alerView.tag = 0
        alerView.show()
    }
    func PandKong()->Bool{
        if(verityField.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入验证码"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        return true
    }

    @IBAction func nextWord(sender: AnyObject) {
        print("下一步")
        if PandKong()==true{
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let next : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Password")
            let code = verityField.text
            
            next.setValue(code, forKey: "code")
            next.setValue(phoneNum, forKey: "phone")
            self.navigationController?.pushViewController(next, animated: true)
            next.title = "修改密码"

        }
        
    }

    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.tag == 0
        {
            if buttonIndex == 1
            {
                self.senderMessage()
                verification.hidden = true
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
            "phone":phoneNum!
            ]
        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
            }
        }
    }
    func timeDow()
    {
        let time1 = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: #selector(VerificationViewController.updateTime), userInfo: nil, repeats: true)
        timeNow = time1
    }
    
    func showRepeatButton()
    {
        timeLabel.hidden=true
        verification.hidden = false
        verification.enabled = true
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

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=false
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        verityField.resignFirstResponder()
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
