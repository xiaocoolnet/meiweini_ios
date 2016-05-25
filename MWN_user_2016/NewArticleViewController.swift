//
//  NewArticleViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import BSImagePicker
import Photos
import Alamofire
import MBProgressHUD


class NewArticleViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var pulish: UIButton!
    var titLab = UITextField()
    let addPicture = UIButton()
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
        pulish.enabled = false
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
        
        let backeView = UIView(frame: CGRectMake(0, 0, WIDTH, WIDTH/4*3))
        backeView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(backeView)
        
        titLab.frame = CGRectMake(12, 8, WIDTH-24, 30)
        titLab.delegate = self
        titLab.placeholder = "请输入标题"
        backeView.addSubview(titLab)
        
        let line = UILabel(frame: CGRectMake(0, 44, WIDTH, 0.5))
        line.backgroundColor = GREY
        backeView.addSubview(line)
        
        self.pictureArray.addObject("ic_tianjiatupian")
        
        self.contentTextView.frame = CGRectMake(8, 50, self.view.bounds.width - 16, WIDTH/4*3-140)
        self.contentTextView.font = UIFont.systemFontOfSize(15)
        self.contentTextView.placeholder = "在此输入文章内容"
        contentTextView.delegate = self
        self.contentTextView.addMaxTextLengthWithMaxLength(200) { (contentTextView) -> Void in
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "超过200字啦"
            hud.margin = 10.0
            hud.removeFromSuperViewOnHide = true
            hud.hide(true, afterDelay: 3)
        }
//        addPicture.frame = CGRectMake(8, WIDTH/4*3-90, 80, 80)
//        addPicture.setBackgroundImage(UIImage(named: "ic_tianjiatupian"), forState: UIControlState.Normal)
//        addPicture.layer.borderWidth = 1.0
//        addPicture.layer.borderColor = UIColor.grayColor().CGColor
//        addPicture.addTarget(self, action: #selector(self.AddPictrures), forControlEvents: UIControlEvents.TouchUpInside)
     
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        flowLayout.itemSize = CGSizeMake(80,80)
        self.collectV = UICollectionView(frame: CGRectMake(8, WIDTH/4*3-90, UIScreen.mainScreen().bounds.width-30, 80), collectionViewLayout: flowLayout)
        self.collectV?.registerClass(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        self.collectV?.delegate = self
        self.collectV?.dataSource = self
        self.collectV?.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.contentTextView)
        self.view.addSubview(self.collectV!)
//        self.view.addSubview(addPicture)
        
        // Do any additional setup after loading the view.
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
            cell.imageView.frame = CGRectMake(0, 0, 80, 80)
            cell.imageView.image = self.pictureArray[indexPath.row] as? UIImage
            cell.contentView.addSubview(cell.imageView)
            if indexPath.row == 0 {
                cell.imageView.image = UIImage(named: "ic_tianjiatupian")
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
    
    func AddPictrures(){
        print("选择图片")
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
                manager.requestImageForAsset(asset[j], targetSize: CGSize(width: 80.0, height: 80.0), contentMode: .AspectFit, options: option, resultHandler: {(result, info)->Void in
                    thumbnail = result!
                    print("图片是")
                    var temImage:CGImageRef = thumbnail.CGImage!
                    temImage = CGImageCreateWithImageInRect(temImage, CGRectMake(0, 0, 80, 80))!
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
            self.AddPictrures()
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        pulish.enabled = true
    }
    
    @IBAction func publishAnArticle(sender: AnyObject) {
        print("发表文章")
        pulish.enabled = false
        titLab.resignFirstResponder()
        contentTextView.resignFirstResponder()
        titLab.text = ""
        contentTextView.text = ""
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        titLab.resignFirstResponder()
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
