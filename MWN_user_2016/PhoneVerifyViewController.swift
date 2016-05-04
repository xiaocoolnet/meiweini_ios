//
//  PhoneVerifyViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PhoneVerifyViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneNum.delegate = self
        nextBtn.userInteractionEnabled = false
        nextBtn.setBackgroundImage(UIImage(named: "xiaoyibu_selected.png"), forState: .Highlighted)
        // Do any additional setup after loading the view.
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        print("编辑")
        
        nextBtn.setBackgroundImage(UIImage(named: "xiaoyibu_pressed.png"), forState: .Normal)
        nextBtn.userInteractionEnabled = true
    }
    @IBAction func nextWord(sender: AnyObject) {
        print("下一步")
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
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let next : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Verification")
            let phone = self.phoneNum.text!
            
            next.setValue(phone, forKey: "phoneNum")
            self.navigationController?.pushViewController(next, animated: true)
            next.title = "获取验证码"
            
        }

        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        phoneNum.resignFirstResponder()
       
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
