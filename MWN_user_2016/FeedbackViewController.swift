//
//  FeedbackViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire

class FeedbackViewController: UIViewController,UITextViewDelegate {

    var rightBtn = UIBarButtonItem()
    
    let contantTextView = BRPlaceholderTextView()
    
    override func viewWillAppear(animated: Bool) {
        rightBtn.enabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "系统反馈"
        self.view.backgroundColor = RGREY
        
        rightBtn = UIBarButtonItem(title: "提交", style: .Done, target: self, action: #selector(self.saveTheMessage))
        
        self.navigationItem.rightBarButtonItem = rightBtn

        contantTextView.frame = CGRectMake(8, 5, self.view.bounds.width - 16, 200)
        contantTextView.font = UIFont.systemFontOfSize(15)
        contantTextView.placeholder = "快来描述一下吧..."
        contantTextView.delegate = self
        contantTextView.addMaxTextLengthWithMaxLength(200) { (contentTextView) -> Void in
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "超过200字啦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 3)
        }
        self.view.addSubview(contantTextView)

        // Do any additional setup after loading the view.
    }

    func textViewDidBeginEditing(textView: UITextView) {
        rightBtn.enabled = true
    }
    func saveTheMessage() {
        print("提交")
        let userid = NSUserDefaults.standardUserDefaults()
        let uid = userid.stringForKey("userid")
        let url = mwnUrl+"addfeedback"
        let param = [
            "userid":uid!,
            "content":contantTextView.text!
        ]
        Alamofire.request(.POST, url, parameters: param).response { request, response, json, error in
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
                    print("Success")
                    self.navigationController?.popToRootViewControllerAnimated(true)
                }
            }
        }

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        contantTextView.resignFirstResponder()
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
