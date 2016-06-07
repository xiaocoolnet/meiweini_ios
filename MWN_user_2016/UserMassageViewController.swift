//
//  UserMassageViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class UserMassageViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var userImage = UIButton()
    var userImageView = UIImageView()
    
    let userName = UILabel()
    var name = UITextField()
    var wemen = UIButton()
    var men = UIButton()
    let sex = UILabel()
    let lady = UILabel()
    let male = UILabel()
    let phone = UILabel()
    var phoneNum = UITextField()
    var clean = UIButton()
    
    let user = NSUserDefaults.standardUserDefaults()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let rightBtn = UIBarButtonItem(title: "保存", style: .Done, target: self, action: #selector(UserMassageViewController.saveThisMassage))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        userImageView.frame = CGRectMake(WIDTH/2-55, 50, 110, 110)
        userImageView.layer.cornerRadius = 55
        userImageView.clipsToBounds = true
        userImageView.image = UIImage(named: "kb3.png")
        
        userImage.frame = CGRectMake(WIDTH/2-55, 50, 110, 110)
        userImage.layer.cornerRadius = 55
        userImage.clipsToBounds = true
//        userImage.setImage(UIImage(named: "kb3.png"), forState: .Normal)
        userImage.addTarget(self, action: #selector(UserMassageViewController.addPicture), forControlEvents: .TouchUpInside)
        
        for i in 0...2 {
            let line = UILabel()
            line.frame = CGRectMake(10, 260+CGFloat(i)*70, WIDTH-20, 1)
            line.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
            
            self.view.addSubview(line)
            
        }
        
        let user = NSUserDefaults.standardUserDefaults()
        let username = user.stringForKey("username")
        let phoneNumber = user.stringForKey("phoneNumber")
        
        userName.frame = CGRectMake(10, 230, 60, 30)
        userName.text = "昵称"
        sex.frame = CGRectMake(10, 300, 60, 30)
        sex.text = "性别"
        phone.frame = CGRectMake(10, 370, 60, 30)
        phone.text = "手机号"
        name.frame = CGRectMake(WIDTH/2-WIDTH/4, 230, WIDTH/2, 30)
        name.textAlignment = .Center
        name.textColor = UIColor(red: 174/255.0, green: 179/255.0, blue: 190/255.0, alpha: 1.0)
        name.text = username
        name.placeholder = "请输入昵称"
        phoneNum.frame = CGRectMake(WIDTH/2-WIDTH/4, 370, WIDTH/2, 30)
        phoneNum.textAlignment = .Center
        phoneNum.textColor = UIColor(red: 174/255.0, green: 179/255.0, blue: 190/255.0, alpha: 1.0)
        phoneNum.text = phoneNumber
        phoneNum.placeholder = "请输入手机号码"
        phoneNum.keyboardType = .NumberPad
        clean.frame = CGRectMake(WIDTH-40, 230, 30, 30)
        clean.setImage(UIImage(named: "ic_guangbi.png"), forState: .Normal)
        clean.addTarget(self, action: #selector(UserMassageViewController.cleanTheText), forControlEvents: .TouchUpInside)
        lady.frame = CGRectMake(WIDTH/3-10, 300, 30, 30)
        lady.text = "女"
        lady.textAlignment = .Center
        wemen.frame = CGRectMake(WIDTH/3+20, 300, 30, 30)
        wemen.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        wemen.addTarget(self, action: #selector(UserMassageViewController.manGetWeman), forControlEvents: .TouchUpInside)
        men.frame = CGRectMake(WIDTH/3*2-20, 300, 30, 30)
        men.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
        men.addTarget(self, action: #selector(UserMassageViewController.wemanGetMan), forControlEvents: .TouchUpInside)
        male.frame = CGRectMake(WIDTH/3*2-50, 300, 30, 30)
        male.text = "男"
        male.textAlignment = .Center
        
        self.view.addSubview(lady)
        self.view.addSubview(male)
        self.view.addSubview(clean)
        self.view.addSubview(phoneNum)
        self.view.addSubview(name)
        self.view.addSubview(sex)
        self.view.addSubview(phone)
        self.view.addSubview(userName)
        self.view.addSubview(userImageView)
        self.view.addSubview(userImage)
        self.view.addSubview(men)
        self.view.addSubview(wemen)
        
        name.delegate = self
        phoneNum.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyBoardChangFrame(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
        

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

    //    添加图片
    func addPicture(){
         print("修改头像")
        let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var image = UIImage()
        image = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        userImageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
        self.saveImage(image, newSize: CGSize(width: 256, height: 256), percent: 0.5, imageName: "currentImage.png")
        
    }
    //保存图片至沙盒
    func saveImage(currentImage: UIImage, newSize: CGSize, percent: CGFloat, imageName: String){
        //压缩图片尺寸
        UIGraphicsBeginImageContext(newSize)
        currentImage.drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //高保真压缩图片质量
        //UIImageJPEGRepresentation此方法可将图片压缩，但是图片质量基本不变，第二个参数即图片质量参数。
        let imageData:NSData = UIImagePNGRepresentation(newImage)!
        //        上传修改
        self.updateHeadImg(imageData)
    }
    //    修改头像
    func updateHeadImg(file:NSData){
        let userid = user.valueForKey("userid") as? String
        let RanNumber = String(arc4random_uniform(1000) + 1000)
        print(userid)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            ConnectModel.uploadWithImageName("2\(userid!)\(RanNumber)", imageData:file, URL: "uploadavatar", finish: { (data) -> Void in
                print("返回值")
                print(data)
                let httpresult = Httpresult(JSONDecoder(data!))
                print("状态是")
                print(httpresult.status)
                if(httpresult.status == "error"){
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = httpresult.errorData
                    hud.margin = 10.0
                    hud.removeFromSuperViewOnHide = true
                    hud.hide(true, afterDelay: 1)
                }
                if(httpresult.status == "success"){
                    print("Success")
                }
            })}
    }

    func cleanTheText() {
        print("清除")
        name.text = ""
    }
    func manGetWeman() {
        print("女")
        men.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        wemen.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
    }
    func wemanGetMan() {
        print("男")
        men.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
        wemen.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
    }
    func PandKong()->Bool{
        if(name.text!.isEmpty){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "请输入昵称"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 1)
            return false
        }
        return true
    }
//    修改信息
    func saveThisMassage() {
        print("保存")
        if self.PandKong() == true {
            let user = NSUserDefaults.standardUserDefaults()
            let uid = user.stringForKey("userid")
            let url = mwnUrl+"savepersonalinfo"
            let param = [
                "userid":uid!,
                "nicename":name.text!,
                "city":"烟台市"
            ]
            Alamofire.request(.POST, url, parameters: param).response { request, response, json, error in
                if(error != nil){
                }
                else{
                    
                    let status = LoginModel(JSONDecoder(json!))
                    print("状态是")
                    print(status.status)
                    if(status.status == "error"){
                        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.mode = MBProgressHUDMode.Text
                        hud.labelText = status.errorData
                        hud.margin = 10.0
                        hud.removeFromSuperViewOnHide = true
                        hud.hide(true, afterDelay: 1)
                    }
                    if(status.status == "success"){
                        print("Success+1")
                        self.navigationController?.popToRootViewControllerAnimated(true)
                    }
                }
            }
        }
    }
    
    func keyBoardChangFrame(info:NSNotification) {
        let infoDic = info.userInfo
        let keyBoardRect = infoDic!["UIKeyboardFrameEndUserInfoKey"]?.CGRectValue()
        let keyBoardTranslate = CGFloat((keyBoardRect?.origin.y)!)
        print(keyBoardRect?.origin.y)
        if keyBoardRect?.origin.y == HEIGHT {
            UIView.animateWithDuration((infoDic!["UIKeyboardAnimationCurveUserInfoKey"]?.doubleValue)!, delay: 0, options: .TransitionNone, animations: {
                self.view.frame = CGRectMake(0, 64, WIDTH, keyBoardTranslate)
                
                }, completion: nil)
        }else{
            if keyBoardTranslate <= 500 {
                if keyBoardTranslate <= 400 {
                    UIView.animateWithDuration((infoDic!["UIKeyboardAnimationCurveUserInfoKey"]?.doubleValue)!, delay: 0, options: .TransitionNone, animations: {
                        self.view.frame = CGRectMake(0, -50, WIDTH, keyBoardTranslate+50)
                        
                        }, completion: nil)
                }else{
                    UIView.animateWithDuration((infoDic!["UIKeyboardAnimationCurveUserInfoKey"]?.doubleValue)!, delay: 0, options: .TransitionNone, animations: {
                        self.view.frame = CGRectMake(0, 50, WIDTH, keyBoardTranslate+14)
                        
                        }, completion: nil)
                }
            }else{
                UIView.animateWithDuration((infoDic!["UIKeyboardAnimationCurveUserInfoKey"]?.doubleValue)!, delay: 0, options: .TransitionNone, animations: {
                    self.view.frame = CGRectMake(0, 64, WIDTH, keyBoardTranslate)
                    
                    //                var rect:CGRect = self.view.frame
                    //                rect.origin.y = keyBoardTranslate
                    //                self.view.frame = rect
                    
                    }, completion: nil)
                
            }
            
        }
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
