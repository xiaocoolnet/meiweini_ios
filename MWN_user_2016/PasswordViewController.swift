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
            baomi = false
        }else{
            baomi1.setImage(UIImage(named: "ic_zhengyan.png"), forState: .Normal)
            baomi = true
        }
        
    }
    @IBAction func passwordSafetyTwo(sender: AnyObject) {
        print("保密")
        if baomiTwo==true {
            baomi2.setImage(UIImage(named: "ic_zhengyan.png"), forState: .Normal)
            baomiTwo = false
        }else{
            baomi2.setImage(UIImage(named: "ic_biyan.png"), forState: .Normal)
            baomiTwo = true
        }
    }
    
    @IBAction func overPassword(sender: AnyObject) {
        print("完成")
        
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
