//
//  MainViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CityViewControllerDelegate {
    
//集合视图
    private let reuseIdentifier = "cell"
    private var collectionView: UICollectionView?
    private var array: [Int] = []
    var cityController:CityViewController!
    var picArr:[String] = ["kb1.png","kb2.png","kb3.png","kb4.png"]

    var titArr:[String] = ["养眼美女","视觉盛宴","火热直播","最新更新"]
    var titImageArr:[String] = ["ic_zuichun.png","ic_shipin","ic_zhibo.png","ic_zuixingengxin.png"]
    
    //五个模块按钮
    let meizhuang = UIButton()
    let meijia = UIButton()
    let gengduo = UIButton()
    let sheying = UIButton()
    let meirong = UIButton()
    
    @IBOutlet weak var location: UIButton!
    @IBOutlet weak var rightItem: UIButton!
//    @IBOutlet weak var mainScrollerView: UIScrollView!
    
// 滚动视图
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    var timer = NSTimer()
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)

        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(MainViewController.scroll), userInfo: nil, repeats: true)
        
        self.createCollectionView()
        
    }
    
    //  ------CollectionView------
    func createCollectionView() {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .Vertical
        flowlayout.itemSize = CGSize(width: (UIScreen.mainScreen().bounds.width-30) / 2, height: (UIScreen.mainScreen().bounds.width-40) / 2)
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        flowlayout.minimumInteritemSpacing = 0.0;
        flowlayout.minimumLineSpacing      = 0.0;
        collectionView = UICollectionView(frame: CGRectMake(0, 0, WIDTH, HEIGHT-60), collectionViewLayout: flowlayout)
        
        for i in 0...3 {
            array.append(i)
        }
        
        // 设置代理
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        // 注册
        collectionView?.registerClass(ChildCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //注册header
        collectionView!.registerClass(HeaderCollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        
        
        if let collectionView = collectionView {
            collectionView.backgroundColor = UIColor.whiteColor()
            view.addSubview(collectionView)
        }

    }
   
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        

        let header:HeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderCollectionReusableView
        
        //  ----------ScrollerView---------
        if (indexPath.section==0) {
            meizhuang.removeFromSuperview()
            meijia.removeFromSuperview()
            gengduo.removeFromSuperview()
            sheying.removeFromSuperview()
            meirong.removeFromSuperview()
            
            
            let header:HeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderCollectionReusableView
            header.backgroundColor = RGREY
            
            header.kindName.text = titArr[indexPath.section]
            header.titImage.image = UIImage(named: titImageArr[indexPath.section])
            
            scrollView.frame = CGRectMake(0, 0,WIDTH, WIDTH/12*5)
            scrollView.pagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.showsVerticalScrollIndicator = false
            scrollView.delegate = self
            
            for i in 0...3 {
                let  imageView = UIImageView()
                imageView.frame = CGRectMake(CGFloat(i)*WIDTH, 0, WIDTH, WIDTH/12*5)
                imageView.image = UIImage(named: picArr[i] )
                imageView.tag = i+1
                //为图片视图添加点击事件
                imageView.userInteractionEnabled = true
                let tap = UITapGestureRecognizer(target: self, action: #selector(MainViewController.tapAction(_:)))
                //            手指头
                tap.numberOfTapsRequired = 1
                //            单击
                tap.numberOfTouchesRequired = 1
                imageView.addGestureRecognizer(tap)
                scrollView.addSubview(imageView)
            }
            scrollView.contentSize = CGSizeMake(4*WIDTH, 0)
            scrollView.contentOffset = CGPointMake(0, 0)
            header.addSubview(scrollView)
            
            pageControl.frame = CGRectMake(0, WIDTH/12*5-30, WIDTH, 17)
            pageControl.pageIndicatorTintColor = UIColor.redColor()
            pageControl.numberOfPages = 4
            pageControl.currentPage = 0
            header.addSubview(pageControl)
            print(pageControl.frame.size.width)
            
            header.more.addTarget(self, action: #selector(MainViewController.beautyViewGo), forControlEvents: .TouchUpInside)
            
        }else if (indexPath.section==1){
            let header:HeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderCollectionReusableView
            header.backgroundColor = RGREY
            
            header.kindName.text = titArr[indexPath.section]
            header.titImage.image = UIImage(named: titImageArr[indexPath.section])
            
            header.more.addTarget(self, action: #selector(MainViewController.videoViewGo), forControlEvents: .TouchUpInside)
        }
        else if (indexPath.section==2){
            scrollView.removeFromSuperview()
            pageControl.removeFromSuperview()
            
            let view = UIView()
            view.frame = CGRectMake(0, 0, WIDTH, WIDTH+30)
            
            let header:HeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderCollectionReusableView
            header.backgroundColor = RGREY
             
            header.kindName.text = titArr[indexPath.section]
            header.titImage.image = UIImage(named: titImageArr[indexPath.section])
            
            
            //五个模块按钮
            meizhuang.frame = CGRectMake(10, 10, (WIDTH-30)/2, WIDTH*0.35+4)
            meizhuang.setBackgroundImage(UIImage(named: "img_meizhuang.png"), forState: .Normal)
            meizhuang.addTarget(self, action: #selector(MainViewController.meizhuangViewGo), forControlEvents: .TouchUpInside)
            view.addSubview(meizhuang)
            
            
            meijia.frame = CGRectMake(10, WIDTH*0.35+24, (WIDTH-30)/2, (WIDTH-10)*0.4)
            meijia.setBackgroundImage(UIImage(named: "img_meijia.png"), forState: .Normal)
            meijia.addTarget(self, action: #selector(MainViewController.meijiaViewGo), forControlEvents: .TouchUpInside)
            view.addSubview(meijia)

            
            gengduo.frame = CGRectMake(10, WIDTH*0.75+30, (WIDTH-30)/2, WIDTH*0.25)
            gengduo.setBackgroundImage(UIImage(named: "img_gengduofuwu.png"), forState: .Normal)
            gengduo.addTarget(self, action: #selector(MainViewController.gengduoViewGo), forControlEvents: .TouchUpInside)
            view.addSubview(gengduo)
            
            
            sheying.frame = CGRectMake(WIDTH/2+5, 10, (WIDTH-30)/2, (WIDTH+10)*0.6)
            sheying.setBackgroundImage(UIImage(named: "img_sheying.png"), forState: .Normal)
            sheying.addTarget(self, action: #selector(MainViewController.sheyingViewGo), forControlEvents: .TouchUpInside)
            view.addSubview(sheying)
            
            
            meirong.frame = CGRectMake(WIDTH/2+5, 10+sheying.bounds.height+10, (WIDTH-30)/2, (WIDTH+10)*0.4)
            meirong.setBackgroundImage(UIImage(named: "img_meirong.png"), forState: .Normal)
            meirong.addTarget(self, action: #selector(MainViewController.meirongViewGo), forControlEvents: .TouchUpInside)
            view.addSubview(meirong)
            
            header.addSubview(view)
            header.more.addTarget(self, action: #selector(MainViewController.liveViewGo), forControlEvents: .TouchUpInside)
        }else{
            let header:HeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderCollectionReusableView
            header.backgroundColor = RGREY
            
            header.kindName.text = titArr[indexPath.section]
            header.titImage.image = UIImage(named: titImageArr[indexPath.section])
            
            header.more.addTarget(self, action: #selector(MainViewController.newViewGo), forControlEvents: .TouchUpInside)
        }
        
        return header
     
    }
    
    //返回分组的头部视图的尺寸，在这里控制分组头部视图的高度
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section==0) {
            return CGSizeMake(UIScreen.mainScreen().bounds.size.width, WIDTH/12*5+44)
        }
        if (section==2) {
            return CGSizeMake(UIScreen.mainScreen().bounds.size.width, WIDTH+74)
        }
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 44)

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: ChildCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ChildCollectionViewCell
        cell.sizeToFit()
        
        cell.imageView?.image = UIImage(named: "kb\(indexPath.row+1).png")
        cell.name?.text = "科比\(array[indexPath.row])"
        cell.number.text = "\(array[indexPath.row]).0万"
        cell.contact.text = "最后的王者\(array[indexPath.row])"
        cell.nameBtn.addTarget(self, action: #selector(self.goToModelView), forControlEvents: .TouchUpInside)
        return cell
    }
    
    func goToModelView() {
        let next = ModelViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let nextView = NextViewViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
        
        
        
    }
    //    图片点击事件
    func tapAction(tap:UIGestureRecognizer) {
        var imageView = UIImageView()
        imageView = tap.view as! UIImageView
        print("这是第\(Int(imageView.tag))张图片")
        let nextView = NextViewViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
        
    }
    func scroll(){
        if (pageControl.currentPage == self.pageControl.numberOfPages-1) {
            pageControl.currentPage = 0
        }else{
            pageControl.currentPage += 1
        }
        let offSetX:CGFloat = CGFloat(pageControl.currentPage) * CGFloat(WIDTH)
        scrollView.setContentOffset(CGPoint(x: offSetX,y: 0), animated: true)
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x)/Int(WIDTH)
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offsetX:CGFloat = scrollView.contentOffset.x
        offsetX = offsetX + (WIDTH * 0.5)
        //pageControll改变
        let page:Int = Int(offsetX)/Int(WIDTH)
        pageControl.currentPage = page
    }
    //开始拖拽时
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        timer.fireDate = NSDate.distantFuture()
    }
    //结束拖拽时
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        timer.fireDate = NSDate.distantPast()
    }
    
    @IBAction func massage(sender: AnyObject) {
        print("消息")
//        let massage = MassageViewController()
//        self.navigationController?.pushViewController(massage, animated: true)
        let view = MineMassageViewController()
        self.navigationController?.pushViewController(view, animated: true)
        

        
    }
    
    @IBAction func locationTheCity(sender: AnyObject) {
        print("定位")
        cityController = CityViewController(nibName: "CityViewController", bundle: nil)
        cityController.delegate = self
        self.navigationController?.pushViewController(cityController, animated: true)
//        self.presentViewController(cityController, animated: true) { () -> Void in
//            
//        }
    }
    func selectCity(city: String) {
        location.setTitle(city, forState: UIControlState.Normal)
        location.sizeToFit()
    }
    
//四组分类
    func beautyViewGo() {
        print("beauty")
        let beauty = BeautyGrilViewController()
        self.navigationController?.pushViewController(beauty, animated: true)
        beauty.title = "美女"
        
    }
    func videoViewGo() {
        print("video")
        let beauty = BeautyGrilViewController()
        self.navigationController?.pushViewController(beauty, animated: true)
        beauty.title = "视频"
        
    }
    func liveViewGo() {
        print("live")
        let beauty = BeautyGrilViewController()
        self.navigationController?.pushViewController(beauty, animated: true)
        beauty.title = "直播"
        
    }
    func newViewGo() {
        print("new")
        let beauty = BeautyGrilViewController()
        self.navigationController?.pushViewController(beauty, animated: true)
        beauty.title = "最新"
        
    }
//五个按钮
    func meizhuangViewGo() {
        print("美妆")
        let meizhuang = SanFangViewController()
        self.navigationController?.pushViewController(meizhuang, animated: true)
        meizhuang.title = "美妆"
        meizhuang.nameArr = ["美妆","美发","设计","造型"]
        
    }
   
    func sheyingViewGo() {
        print("摄影")
        let sheying = SanFangViewController()
        self.navigationController?.pushViewController(sheying, animated: true)
        sheying.title = "摄影"
        sheying.nameArr = ["摄影","演出","车展","赛事"]
        
    }
    func meirongViewGo() {
        print("美容")
        let meirong = SanFangViewController()
        self.navigationController?.pushViewController(meirong, animated: true)
        meirong.title = "美容"
        meirong.nameArr = ["美容","美体","保健","保养"]
        
    }
    func meijiaViewGo() {
        print("美甲")
        let meijia = MeijiaViewController()
        self.navigationController?.pushViewController(meijia, animated: true)
        meijia.title = "美甲"
        
        
    }
    func gengduoViewGo() {
        print("更多")
        let gengduo = GengduoViewController()
        self.navigationController?.pushViewController(gengduo, animated: true)
        gengduo.title = "更多"
        
        gengduo.nameArr = ["健身","舞蹈","教育","陪游","陪吃","陪玩"]
        
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

