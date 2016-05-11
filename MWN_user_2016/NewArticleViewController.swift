//
//  NewArticleViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class NewArticleViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var pulish: UIButton!
    @IBOutlet weak var titLab: UITextField!
    @IBOutlet weak var placeholder: UILabel!
    @IBOutlet weak var textArt: UITextView!
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        pulish.enabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = RGREY
        textArt.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    func textViewDidBeginEditing(textView: UITextView) {
        placeholder.hidden = true
        pulish.enabled = true
    }
    
    @IBAction func addPicture(sender: AnyObject) {
        print("添加图片")
        titLab.resignFirstResponder()
        textArt.resignFirstResponder()
        
    }
    
    @IBAction func publishAnArticle(sender: AnyObject) {
        print("发表文章")
        pulish.enabled = false
        placeholder.hidden = false
        titLab.resignFirstResponder()
        textArt.resignFirstResponder()
        titLab.text = ""
        textArt.text = ""
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        titLab.resignFirstResponder()
        textArt.resignFirstResponder()
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
