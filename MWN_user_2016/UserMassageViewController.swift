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

class UserMassageViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate {
    
    var userImage = UIButton()
    let userName = UILabel()
    var name = UIButton()
    var wemen = UIButton()
    var men = UIButton()
    let sex = UILabel()
    let lady = UILabel()
    let male = UILabel()
    let phone = UILabel()
    var phoneNum = UIButton()
    
    var alertView = UIAlertController()
    var myActionSheet:UIAlertController?
    
    let user = NSUserDefaults.standardUserDefaults()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
        let userSex = user.stringForKey("sex")
        wemen.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        men.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        if userSex == "0" {
            wemen.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
            men.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        }
        if userSex == "1" {
            wemen.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
            men.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
        }
        print(userSex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = RGREY
        let photo = user.stringForKey("photo")
        
        
        let rightBtn = UIBarButtonItem(title: "保存", style: .Done, target: self, action: #selector(UserMassageViewController.saveThisMassage))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        
        userImage.frame = CGRectMake(WIDTH/2-55, 50, 110, 110)
        userImage.layer.cornerRadius = 55
        userImage.sd_setImageWithURL(NSURL(string: "http://mwn.xiaocool.net/uploads/avatar/\(photo)"), forState: .Normal, placeholderImage: UIImage(named: "kb3.png"))
        userImage.clipsToBounds = true
        
//        修改头像
        myActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        myActionSheet?.addAction(UIAlertAction(title: "拍照", style: .Default, handler: {[unowned self] (UIAlertAction) in
            dispatch_async(dispatch_get_main_queue(), {
                self.takePhoto()
            })
        }))
        if TCUserInfo.currentInfo.photo != "" {
            let imageUrlStr = photoUrl + photo!
            let url = NSURL(string: imageUrlStr)
            userImage.sd_setImageWithURL(url, forState: .Normal)
        }
        
        myActionSheet?.addAction(UIAlertAction(title: "从相册获取", style: .Default, handler: { [unowned self] (UIAlertAction) in
            dispatch_async(dispatch_get_main_queue(), {
                self.LocalPhoto()
            })
        }))
        myActionSheet?.addAction(UIAlertAction(title: "取消", style: .Cancel, handler:nil))

        userImage.addTarget(self, action: #selector(UserMassageViewController.addPicture), forControlEvents: .TouchUpInside)
        
        for i in 0...2 {
            let line = UILabel()
            line.frame = CGRectMake(10, 260+CGFloat(i)*70, WIDTH-20, 1)
            line.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
            self.view.addSubview(line)
        }
        
        let username = user.stringForKey("username")
        let phoneNumber = user.stringForKey("phoneNumber")
        
        userName.frame = CGRectMake(10, 230, 60, 30)
        userName.text = "昵称"
        sex.frame = CGRectMake(10, 300, 60, 30)
        sex.text = "性别"
        phone.frame = CGRectMake(10, 370, 60, 30)
        phone.text = "手机号"
        name.frame = CGRectMake(WIDTH/2-WIDTH/4, 230, WIDTH/2, 30)
        name.setTitle(username, forState: .Normal)
        name.setTitleColor(UIColor(red: 174/255.0, green: 179/255.0, blue: 190/255.0, alpha: 1.0), forState: .Normal)
        name.addTarget(self, action: #selector(self.modifyUserName), forControlEvents: .TouchUpInside)
        
        phoneNum.frame = CGRectMake(WIDTH/2-WIDTH/4, 370, WIDTH/2, 30)
        phoneNum.setTitle(phoneNumber, forState: .Normal)
        phoneNum.setTitleColor(UIColor(red: 174/255.0, green: 179/255.0, blue: 190/255.0, alpha: 1.0), forState: .Normal)
        phoneNum.addTarget(self, action: #selector(self.modifyPhotoNumber), forControlEvents: .TouchUpInside)
        let jiantou = UIButton(frame: CGRectMake(WIDTH-35, 370, 30, 30))
        jiantou.addTarget(self, action: #selector(self.modifyPhotoNumber), forControlEvents: .TouchUpInside)
        jiantou.setImage(UIImage(named: "ic_arrow_right"), forState: .Normal)
        
        lady.frame = CGRectMake(WIDTH/3-10, 300, 30, 30)
        lady.text = "女"
        lady.textAlignment = .Center
        wemen.frame = CGRectMake(WIDTH/3+20, 300, 30, 30)
        wemen.addTarget(self, action: #selector(UserMassageViewController.manGetWeman), forControlEvents: .TouchUpInside)
        men.frame = CGRectMake(WIDTH/3*2-20, 300, 30, 30)
        men.addTarget(self, action: #selector(UserMassageViewController.wemanGetMan), forControlEvents: .TouchUpInside)
        
        
        male.frame = CGRectMake(WIDTH/3*2-50, 300, 30, 30)
        male.text = "男"
        male.textAlignment = .Center
        
        self.view.addSubview(lady)
        self.view.addSubview(male)
        self.view.addSubview(phoneNum)
        self.view.addSubview(jiantou)
        self.view.addSubview(name)
        self.view.addSubview(sex)
        self.view.addSubview(phone)
        self.view.addSubview(userName)
        self.view.addSubview(userImage)
        self.view.addSubview(men)
        self.view.addSubview(wemen)
        
    }
    func addPicture() {
        print("上传图片")
        presentViewController(myActionSheet!, animated: true, completion:nil)
    }
//    拍照
    func takePhoto(){
        let sourceType = UIImagePickerControllerSourceType.Camera
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            self.presentViewController(picker, animated: true, completion: nil)
        }else{
            print("无法打开相机")
        }
        
    }
//    相册
    func LocalPhoto(){
        let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        presentViewController(picker, animated: true, completion: nil)
    }
    // MARK: ------imagepickerDelegate-------
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let type = info[UIImagePickerControllerMediaType] as! String
        if type != "public.image" {
            return
        }
        //裁剪后图片
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        userImage.setImage(image, forState: .Normal)
        let data = UIImageJPEGRepresentation(image, 0.1)!
        let dateFormatter = NSDateFormatter()
        let uid = user.stringForKey("userid")
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        let dateStr = dateFormatter.stringFromDate(NSDate())
        let imageName = "avatar" + dateStr + uid!
        ConnectModel.uploadWithImageName(imageName, imageData: data, URL: "uploadavatar") { [unowned self] (data) in
            dispatch_async(dispatch_get_main_queue(), {
                let result = Http(JSONDecoder(data))
                if result.status != nil {
                    if result.status! == "success"{
                        let imageName = result.data?.string!
                        UserInfomation.init().avatar = imageName!
                        print("上传成功")
                    }else{
                        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.mode = MBProgressHUDMode.Text
                        hud.labelText = "图像上传失败"
                        hud.margin = 10.0
                        hud.removeFromSuperViewOnHide = true
                        hud.hide(true, afterDelay: 1)

                    }
                }
            })
        }
        
        picker.dismissViewControllerAnimated(true, completion: nil)
       
    }
    func PandKong()->Bool{
        if(alertView.textFields![0].text!.isEmpty){
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

//    修改昵称
    func modifyUserName() {
        print("修改昵称")
        alertView = UIAlertController.init(title: nil, message: "您要修改昵称吗？", preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addTextFieldWithConfigurationHandler({ (UITextField) -> Void in
            UITextField.placeholder = "请输入昵称"
            UITextField.clearButtonMode = UITextFieldViewMode.WhileEditing
        })
        let alertViewAction: UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            if self.PandKong() == true {
                let uid = self.user.stringForKey("userid")
                let url = mwnUrl+"UpdateUserName"
                let param = [
                    "userid":uid!,
                    "nicename":self.alertView.textFields![0].text!
                ]
                Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
                    if(error != nil){
                    }
                    else{
                        
                        let status = LoginModel(JSONDecoder(json!))
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
                            print("Success+昵称")
                            self.name.setTitle(self.alertView.textFields![0].text, forState: .Normal)
                            
                        }
                    }
                }
            }
        })
        let alertViewCancelAction: UIAlertAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alertView.addAction(alertViewAction)
        alertView.addAction(alertViewCancelAction)
        self.presentViewController(alertView, animated:true , completion: nil)
        
    }
    
    func modifyPhotoNumber() {
        print("修改电话号码")
        let next = PhoneViewController()
        self.navigationController?.pushViewController(next, animated: true)
        next.title = "修改手机号码"
        
    }
    //    添加图片——不裁剪
//    func changePicture(){
//         print("修改头像")
//        let picker = UIImagePickerController()
//        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        picker.delegate = self
//        self.presentViewController(picker, animated: true, completion: nil)
//    }
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        var image = UIImage()
//        image = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
//        userImageView.image = image
//        picker.dismissViewControllerAnimated(true, completion: nil)
//        self.saveImage(image, newSize: CGSize(width: 256, height: 256), percent: 0.5, imageName: "currentImage.png")
//        
//    }
    //保存图片至沙盒
//    func saveImage(currentImage: UIImage, newSize: CGSize, percent: CGFloat, imageName: String){
//        //压缩图片尺寸
//        UIGraphicsBeginImageContext(newSize)
//        currentImage.drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
//        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        //高保真压缩图片质量
//        //UIImageJPEGRepresentation此方法可将图片压缩，但是图片质量基本不变，第二个参数即图片质量参数。
//        let imageData:NSData = UIImagePNGRepresentation(newImage)!
//        //        上传修改
//        self.updateHeadImg(imageData)
//    }
    //    修改头像
//    func updateHeadImg(file:NSData){
//        let userid = user.valueForKey("userid") as? String
//        let RanNumber = String(arc4random_uniform(1000) + 1000)
//        print(userid)
//        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
//            ConnectModel.uploadWithImageName("2\(userid!)\(RanNumber)", imageData:file, URL: "uploadavatar", finish: { (data) -> Void in
//                print("返回值")
//                print(data)
//                let httpresult = Httpresult(JSONDecoder(data!))
//                print("状态是")
//                print(httpresult.status)
//                if(httpresult.status == "error"){
//                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
//                    hud.mode = MBProgressHUDMode.Text
//                    hud.labelText = httpresult.errorData
//                    hud.margin = 10.0
//                    hud.removeFromSuperViewOnHide = true
//                    hud.hide(true, afterDelay: 1)
//                }
//                if(httpresult.status == "success"){
//                    print("Success")
//                }
//            })}
//    }

    
    
//    修改性别
    func manGetWeman() {
        print("女")
        men.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        wemen.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
        let uid = user.stringForKey("userid")
        let url = mwnUrl+"UpdateUserSex"
        let param = [
            "userid":uid!,
            "sex":0
        ]
        Alamofire.request(.GET, url, parameters: param as? [String : AnyObject]).response { request, response, json, error in
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
                    print("Success+女")
                }
            }
        }
    }
    func wemanGetMan() {
        print("男")
        men.setImage(UIImage(named: "ic_xuanzhong-shi.png"), forState: .Normal)
        wemen.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        let uid = user.stringForKey("userid")
        let url = mwnUrl+"UpdateUserSex"
        let param = [
            "userid":uid!,
            "sex":1
        ]
        Alamofire.request(.GET, url, parameters: param as? [String : AnyObject]).response { request, response, json, error in
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
                    print("Success+男")
                }
            }
        }
    }
  
//    修改信息
    func saveThisMassage() {
        
        print("保存")
        self.navigationController?.popToRootViewControllerAnimated(true)
        
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
