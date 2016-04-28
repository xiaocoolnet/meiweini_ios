//
//  PersonCertificationViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PersonCertificationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var certification: UIButton!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var sheying: UIButton!
    @IBOutlet weak var meizhuang: UIButton!
    @IBOutlet weak var meija: UIButton!
    @IBOutlet weak var meirong: UIButton!
    @IBOutlet weak var more: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = RGREY
        
        name.delegate = self
        phoneNum.delegate = self
        
        certification.setImage(UIImage(named: "lijitijiao_pressed.png"), forState: .Highlighted)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func selectorTheWork(sender: AnyObject) {
        print("选择\(sender.tag)")
        
        
    }
    
    @IBAction func personCertification(sender: AnyObject) {
        print("提交")
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        phoneNum.resignFirstResponder()
        name.resignFirstResponder()
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
