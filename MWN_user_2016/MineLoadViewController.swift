//
//  MineLoadViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import PagingMenuController
import Photos
import Alamofire
import MBProgressHUD
import BSImagePicker

class MineLoadViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var update: UIBarButtonItem!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var muchField: UITextField!
    @IBOutlet weak var clear: UISwitch!
    var addPicture = UIButton()
    
    var imageData:[NSData] = []
    var isuploading = false
    var imageUrl:String?
    var i = 0
    var imagePath = NSMutableArray()
    var pictureArray = NSMutableArray()
    var picture = UIImageView()
    let contentTextView = BRPlaceholderTextView()
    var itemCount = 1
    var collectV:UICollectionView?
    var flowLayout = UICollectionViewFlowLayout()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
        update.enabled = false
        if(self.i>9){
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "最多选择9张图片哦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 2)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RGREY
        
        let backLab = UILabel(frame: CGRectMake(0, 0, WIDTH, 210-WIDTH*20/375))
        backLab.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(backLab)
        
        self.pictureArray.addObject("上传")
        
        self.contentTextView.frame = CGRectMake(10, 5, self.view.bounds.width - 20, 210-WIDTH*20/375-82)
        self.contentTextView.font = UIFont.systemFontOfSize(15)
        self.contentTextView.placeholder = "快来描述一下吧..."
        self.contentTextView.addMaxTextLengthWithMaxLength(200) { (contentTextView) -> Void in
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "超过200字啦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 3)
        }
        
        
//        addPicture.frame = CGRectMake(8, WIDTH*9/20-74, 66, 66)
//        addPicture.setBackgroundImage(UIImage(named: "上传"), forState: UIControlState.Normal)
//        addPicture.layer.borderWidth = 1.0
//        addPicture.layer.borderColor = UIColor.grayColor().CGColor
//        addPicture.addTarget(self, action: #selector(self.addPictureTheView), forControlEvents: UIControlEvents.TouchUpInside)
//        
   
        contentTextView.delegate = self
        nameField.delegate = self
        muchField.delegate = self
        nameField.tag = 1
        muchField.tag = 2
        
        clear.onTintColor = COLOR
        
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        flowLayout.itemSize = CGSizeMake(66,66)
        self.collectV = UICollectionView(frame: CGRectMake(10, 210-WIDTH*20/375-74, UIScreen.mainScreen().bounds.width-30, 70), collectionViewLayout: flowLayout)
        self.collectV?.registerClass(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        self.collectV?.delegate = self
        self.collectV?.dataSource = self
        self.collectV?.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.contentTextView)
        self.view.addSubview(self.collectV!)
        self.view.addSubview(addPicture)
        
        // Do any additional setup after loading the view.
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyBoardChangFrame(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    func keyBoardChangFrame(info:NSNotification) {
        let infoDic = info.userInfo
        let keyBoardRect = infoDic!["UIKeyboardFrameEndUserInfoKey"]?.CGRectValue()
        let keyBoardTranslate = CGFloat((keyBoardRect?.origin.y)!)
        print(keyBoardRect?.origin.y)
        print(HEIGHT)
        if keyBoardRect?.origin.y == HEIGHT {
            UIView.animateWithDuration((infoDic!["UIKeyboardAnimationCurveUserInfoKey"]?.doubleValue)!, delay: 0, options: .TransitionNone, animations: {
                self.view.frame = CGRectMake(0, 64, WIDTH, HEIGHT-64)
                }, completion: nil)
        }else{
            if keyBoardRect?.origin.y <= 450 {
                UIView.animateWithDuration((infoDic!["UIKeyboardAnimationCurveUserInfoKey"]?.doubleValue)!, delay: 0, options: .TransitionNone, animations: {
                    self.view.frame = CGRectMake(0, -(390-keyBoardTranslate), WIDTH, HEIGHT-64)
                    
                    }, completion: nil)
                contentTextView.addTextViewBeginEvent { (contentTextView) in
                    UIView.animateWithDuration(0.1, animations: {
                        self.view.frame = CGRectMake(0, 64, WIDTH, HEIGHT-64)
                    })
                }
            }
        }
    }

    func addPictureTheView() {
        print("添加图片")
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 9
        bs_presentImagePickerController(vc, animated: true,
                                        select: { (asset: PHAsset) -> Void in
            }, deselect: { (asset: PHAsset) -> Void in
            }, cancel: { (assets: [PHAsset]) -> Void in
            }, finish: { (assets: [PHAsset]) -> Void in
                self.getAssetThumbnail(assets)
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    self.collectV!.reloadData()
                }
            }, completion: nil)
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print("显示")
        print(self.pictureArray[indexPath.row])
        let cell:ImageCollectionViewCell  = collectV!.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        if(self.pictureArray.count != 0){
            cell.imageView.frame = CGRectMake(0, 0, 66, 66)
            cell.imageView.image = self.pictureArray[indexPath.row] as? UIImage
            cell.contentView.addSubview(cell.imageView)
            if indexPath.row == 0 {
                cell.imageView.image = UIImage(named: "上传")
            }
            return cell
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    //    上下间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return CGFloat(6)
    }
    
    func getAssetThumbnail(asset: [PHAsset]) -> UIImage {
        var thumbnail = UIImage()
        i+=asset.count
        if(i>9){
        }
        else{
            print("选择的图片有\(i)张")
            if(itemCount == 0){
                itemCount = asset.count + 1
                self.pictureArray.insertObject("", atIndex: 0)
            }
            else{
                itemCount += asset.count
            }
            let manager = PHImageManager.defaultManager()
            let option = PHImageRequestOptions()
            option.synchronous = true
            for j in 0..<asset.count{
                manager.requestImageForAsset(asset[j], targetSize: CGSize(width: 66.0, height: 66.0), contentMode: .AspectFit, options: option, resultHandler: {(result, info)->Void in
                    thumbnail = result!
                    print("图片是")
                    var temImage:CGImageRef = thumbnail.CGImage!
                    temImage = CGImageCreateWithImageInRect(temImage, CGRectMake(0, 0, 66, 66))!
                    let newImage = UIImage(CGImage: temImage)
                    self.imageData.append(UIImageJPEGRepresentation(newImage, 1)!)
                    self.pictureArray.addObject(newImage)
                })
            }
        }
        return thumbnail
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if indexPath.row == 0 {
            self.addPictureTheView()
        }
    }

    @IBAction func clearAllPicture(sender: AnyObject) {
        
        if clear.on == false {
            print("清理图片")
            contentTextView.resignFirstResponder()
//            itemCount = 0
//            collectV?.reloadData()
        }else{
            print("没有什么")
        }
    }
    func textViewDidBeginEditing(textView: UITextView) {
        update.enabled = true
    }
    
    @IBAction func upDate(sender: AnyObject) {
        print("上传")

        contentTextView.resignFirstResponder()
        nameField.resignFirstResponder()
        muchField.resignFirstResponder()
        update.enabled = false
        contentTextView.text = ""
        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        nameField.resignFirstResponder()
        muchField.resignFirstResponder()
        contentTextView.resignFirstResponder()
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
