//
//  VerificationViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var verityField: UITextField!
    @IBOutlet weak var phoneNUm: UILabel!

    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        verityField.delegate = self
        nextBtn.userInteractionEnabled = false
        
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
        
    }
    @IBAction func nextWord(sender: AnyObject) {
        print("下一步")
       
        
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
