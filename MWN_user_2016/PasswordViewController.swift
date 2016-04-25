//
//  PasswordViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    @IBOutlet weak var overBtn: UIButton!
    @IBOutlet weak var baomi1: UIButton!
    @IBOutlet weak var baomi2: UIButton!
    
    var baomi = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        baomi = true
        
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
            baomi = false
        }else{
            baomi1.setImage(UIImage(named: "ic_zhengyan.png"), forState: .Normal)
            baomi = true
        }
        
    }
    @IBAction func passwordSafetyTwo(sender: AnyObject) {
        print("保密")
        if baomi==true {
            baomi2.setImage(UIImage(named: "ic_zhengyan.png"), forState: .Normal)
            baomi = false
        }else{
            baomi2.setImage(UIImage(named: "ic_biyan.png"), forState: .Normal)
            baomi = true
        }
    }
    
    @IBAction func overPassword(sender: AnyObject) {
        print("完成")
        
        
        
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
