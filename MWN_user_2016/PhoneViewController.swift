//
//  PhoneViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PhoneViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var verification: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBtn = UIBarButtonItem(title: "提交", style: .Done, target: self, action: #selector(self.getUpPhoneNumber))
        navigationItem.rightBarButtonItem = rightBtn
        

        // Do any additional setup after loading the view.
    }

    func getUpPhoneNumber() {
        print("修改手机号")
        phoneNumber.resignFirstResponder()
        verification.resignFirstResponder()
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func getUpVerification(sender: AnyObject) {
        print("获取验证码")
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        phoneNumber.resignFirstResponder()
        verification.resignFirstResponder()
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
