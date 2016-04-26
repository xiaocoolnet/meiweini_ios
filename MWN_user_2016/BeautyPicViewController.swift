//
//  BeautyPicViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BeautyPicViewController: UIViewController {

    var index : Int? = 0
    var flowLayout : RANFlowLayout?
    var collectionView : UICollectionView?
    var addMoreButton : UIButton?
    lazy var tempArray : NSMutableArray = {
        return NSMutableArray()
    }()
    lazy var dataArray : NSArray = {
        
        return getDataArray(self)()
    }()
    func getDataArray()->NSArray{
        let plistIndex = self.index! % 3 + 1
        let path = NSBundle.mainBundle().pathForResource("\(plistIndex).plist", ofType: nil)
        let dictArray = NSArray(contentsOfFile: path!)
        print(path)
        for dict in dictArray! {
            let model = RANModel().initWithDict(dict as! NSDictionary)
            tempArray.addObject(model)
        }
        return tempArray as NSArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = RGREY
        
        flowLayout = RANFlowLayout()
        collectionView = UICollectionView(frame: CGRectMake(0, 10, WIDTH, HEIGHT-124), collectionViewLayout: flowLayout!)
        collectionView?.registerClass(RANCollectionViewCell.self, forCellWithReuseIdentifier: "RANCollectionViewCell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.backgroundColor = RGREY
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 50, 0)
        view.addSubview(collectionView!)
        
        //传递相关数据
        //当前界面显示多少列
        flowLayout?.colCount = 2
        //把加载的数据传过去，得到宽高比
        flowLayout?.shops = self.dataArray
        
        initAddMoreButton()
        
    }
    
    func initAddMoreButton(){
        
        print("加载更多")
        addMoreButton = UIButton(frame: CGRectMake(0, HEIGHT - 200, self.view.bounds.size.width, 44))
        addMoreButton!.setTitle("加载更多", forState: UIControlState.Normal)
        addMoreButton?.setTitleColor(GREY, forState: .Normal)
        addMoreButton!.addTarget(self, action: #selector(BeautyPicViewController.addMoreButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        addMoreButton!.backgroundColor = RGREY
        addMoreButton?.alpha = 0.0
        self.view.addSubview(addMoreButton!)
    }
    
    func addMoreButtonClick(button : UIButton){
        print("正在加载")
        
        index = index! + 1
        button.enabled = false
        button.setTitle("正在加载", forState: UIControlState.Normal)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        //模拟网络请求  延时2秒加载数据
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            self.dataArray = self.getDataArray()
            self.collectionView?.reloadData()
            button.setTitle("加载更多", forState: UIControlState.Normal)
            button.enabled = true
            self.addMoreButton?.alpha = 0.0
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

extension BeautyPicViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.dataArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RANCollectionViewCell", forIndexPath: indexPath) as! RANCollectionViewCell
        cell.shops = self.dataArray[indexPath.item] as? RANModel
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let next = NextViewViewController()
        self.navigationController?.pushViewController(next, animated: true)
        next.title = "美图"
       
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        //        print(scrollView.contentOffset.y)
        //        print(scrollView.contentSize)
        //        print(self.view.bounds.size.height)
        let scrollH = scrollView.contentSize.height - self.view.bounds.size.height + 50
        let height = scrollH - scrollView.contentOffset.y
        print(height)
        if height <= 44 && height >= 0 {
            addMoreButton?.alpha = (CGFloat(44) - height) / CGFloat(44)
        }else if (height < 0){
            addMoreButton?.alpha = 1.0
        }else{
            addMoreButton?.alpha = 0.0
        }
    }
    
}
