//
//  MineLoadViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import PagingMenuController

class MineLoadViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var textViewText: UITextView!
    @IBOutlet weak var update: UIBarButtonItem!
    let placeHolder = UILabel()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var muchField: UITextField!
    @IBOutlet weak var clear: UISwitch!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        update.enabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RGREY
        
        placeHolder.frame = CGRectMake(5, 6, 150, 20)
        placeHolder.textColor = GREY
        placeHolder.font = UIFont.systemFontOfSize(14)
        placeHolder.text = "快来描述一下吧..."
        textViewText.addSubview(placeHolder)
        
        textViewText.delegate = self
        nameField.delegate = self
        muchField.delegate = self
        
        clear.onTintColor = COLOR
        
        // Do any additional setup after loading the view.
    }

    @IBAction func addPicture(sender: AnyObject) {
        print("添加图片")
        
        
    }
    @IBAction func clearAllPicture(sender: AnyObject) {
        
        if clear.on == false {
            print("清理图片")
        }else{
            print("没有什么")
        }
    }
    func textViewDidBeginEditing(textView: UITextView) {
        placeHolder.hidden = true
        update.enabled = true
    }
    @IBAction func upDate(sender: AnyObject) {
        print("上传")
        nameField.resignFirstResponder()
        muchField.resignFirstResponder()
        textViewText.resignFirstResponder()
        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        nameField.resignFirstResponder()
        muchField.resignFirstResponder()
        textViewText.resignFirstResponder()
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
