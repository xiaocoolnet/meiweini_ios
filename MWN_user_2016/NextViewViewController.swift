//
//  NextViewViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class NextViewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var beautyTable = UITableView()
    let downView = UIView()
    
    private let reuseIdentifier = "cell"
    private var collectionView: UICollectionView?
    private var array: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        self.title = "商品界面"
        self.view.backgroundColor = RGREY
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "ic_shanghu.png"), style: .Done, target: self, action: #selector(NextViewViewController.shareBtn))
        self.navigationItem.rightBarButtonItem = rightItem
        
        beautyTable.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64)
        beautyTable.backgroundColor = UIColor.clearColor()
        beautyTable.delegate = self
        beautyTable.dataSource = self
        beautyTable.registerClass(CommentTableViewCell.self, forCellReuseIdentifier: "comment")
        beautyTable.registerClass(PhotoalbumTableViewCell.self, forCellReuseIdentifier: "photoalbum")
        beautyTable.registerClass(PhotoTableViewCell.self, forCellReuseIdentifier: "photo")
        beautyTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(beautyTable)
        
        let footView = UIView(frame: CGRectMake(0, 0, WIDTH, 40))
        let prompt = UILabel()
        prompt.frame = CGRectMake(WIDTH/4, 10, WIDTH/2, 20)
        prompt.font = UIFont.systemFontOfSize(14)
        prompt.textColor = GREY
        prompt.text = "没有更多了"
        prompt.textAlignment = .Center
        footView.addSubview(prompt)
        footView.backgroundColor = RGREY
        beautyTable.tableFooterView = footView

        self.downViewSet()
       
        // Do any additional setup after loading the view.
    }
    func downViewSet() {
        downView.frame = CGRectMake(0, HEIGHT-108, WIDTH, 44)
        downView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(downView)
        
        let focus = UIImageView()
        focus.frame = CGRectMake(10, 14, 18, 16)
        focus.image = UIImage(named: "ic_guanzhu.png")
        let focusBtn = UIButton()
        focusBtn.frame = CGRectMake(25, 2, 50, 40)
        focusBtn.setTitle("关注", forState: .Normal)
        focusBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        focusBtn.setTitle("", forState: .Highlighted)
        focusBtn.addTarget(self, action: #selector(NextViewViewController.focusTheBeauty), forControlEvents: .TouchUpInside)
        downView.addSubview(focus)
        downView.addSubview(focusBtn)
        
        let downBtn = UIButton()
        downBtn.frame = CGRectMake(WIDTH/4, 7, WIDTH/2, 30)
        downBtn.setImage(UIImage(named: "xiazai_normal.png"), forState: .Normal)
        downBtn.setImage(UIImage(named: "xiazai_pressed.png"), forState: .Highlighted)
        downBtn.addTarget(self, action: #selector(NextViewViewController.downLoadBeauty), forControlEvents: .TouchUpInside)
        downView.addSubview(downBtn)
        
        
        let comment = UIImageView()
        comment.frame = CGRectMake(WIDTH-28, 14, 18, 16)
        comment.image = UIImage(named: "ic_pinglun.png")
        let commentBtn = UIButton()
        commentBtn.frame = CGRectMake(WIDTH-75, 2, 50, 40)
        commentBtn.setTitle("评论", forState: .Normal)
        commentBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        commentBtn.setTitle("", forState: .Highlighted)
        commentBtn.addTarget(self, action: #selector(NextViewViewController.commentTheBeauty), forControlEvents: .TouchUpInside)
        downView.addSubview(comment)
        downView.addSubview(commentBtn)
        
        
        
    }

    func focusTheBeauty() {
        print("关注")
        
    }
    func commentTheBeauty() {
        print("评论")
        
    }
    func downLoadBeauty() {
        print("下载")
        let down = DownViewController()
        self.navigationController?.pushViewController(down, animated: true)
        down.title = "下载"
        
    }
    func shareBtn() {
        print("商家界面")
        let shop = ShopsViewController()
        self.navigationController?.pushViewController(shop, animated: true)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }else if section == 1 {
            return 1
        }else{
            return 4
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return WIDTH
            }else{
                return 90
            }
        }else if indexPath.section == 1 {
            return 190
        }else{
            return 105
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 40
        }
    }
   
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        let prompt = UILabel()
        prompt.frame = CGRectMake(15, 10, WIDTH/4, 20)
        prompt.font = UIFont.systemFontOfSize(14)
        prompt.textColor = UIColor(red: 129/255.0, green: 129/255.0, blue: 129/255.0, alpha: 1.0)
        if section == 1 {
            prompt.text = "类似推荐"
        }else{
            prompt.text = "评论（34）"
        }
        headView.addSubview(prompt)
        headView.backgroundColor = UIColor.clearColor()
        return headView
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("photo")as!PhotoTableViewCell
                cell.selectionStyle = .None
//                cell.photoNum.text = "1/8"
                cell.zanBtn.addTarget(self, action: #selector(NextViewViewController.zanButton), forControlEvents: .TouchUpInside)
                
                return cell
                
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("photoalbum")as!PhotoalbumTableViewCell
                cell.selectionStyle = .None
                cell.photoName.text = "美女相册"
                cell.price.text = "¥88.88"
                cell.comment.text = "勇敢是，当你还未开始就已知道自己会输，可你依然要去做，而且无论如何都要把它坚持到底。"
                return cell
                
            }
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell")
            cell!.selectionStyle = .None
            
            let flowlayout = UICollectionViewFlowLayout()
            flowlayout.scrollDirection = .Vertical
            flowlayout.itemSize = CGSize(width: (UIScreen.mainScreen().bounds.width-30) / 2, height: (UIScreen.mainScreen().bounds.width-40) / 2)
            flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
            flowlayout.minimumInteritemSpacing = 0.0;
            flowlayout.minimumLineSpacing      = 0.0;
            collectionView = UICollectionView(frame: CGRectMake(0, 0, WIDTH, 190), collectionViewLayout: flowlayout)
            
            for i in 0...1 {
                array.append(i)
            }
            
            // 设置代理
            collectionView?.delegate = self
            collectionView?.dataSource = self
            
            // 注册
            collectionView?.registerClass(ChildCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
            
            if let collectionView = collectionView {
                collectionView.backgroundColor = UIColor.whiteColor()
                cell!.addSubview(collectionView)
                collectionView.scrollEnabled = false
            }

            return cell!
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("comment", forIndexPath: indexPath)as!CommentTableViewCell
            cell.selectionStyle = .None
            cell.userImage.image = UIImage(named: "kb1.png")
            cell.userName.text = "长风落叶"
            cell.userComment.text = "你就是那种看到脆弱不会飞的雏鸟就想帮它飞翔，抛出去之后就沉浸在自我满足中的人吧？这种人最差劲了。当你得意洋洋地离开之后，小鸟就会掉到柏油路上摔死，可是你却根本不会发现。耍笨也要有个限度。"
            cell.userDate.text = "4月25日"
            cell.zanNum.text = "235"
            cell.comment.text = "345"
            cell.zanBtn.addTarget(self, action: #selector(NextViewViewController.zanGetUp), forControlEvents: .TouchUpInside)
            cell.commentBtn.addTarget(self, action: #selector(NextViewViewController.commonGetUp), forControlEvents: .TouchUpInside)
            
            return cell
            
        }
        
    }
    func zanGetUp() {
        print("增加赞")
        
    }
    func commonGetUp() {
        print("增加评论")
        
        
    }
    func zanButton() {
        print("赞")
        
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        
        
        
    }
    
    // MARK: - UICollectionViewDataSource
//    组数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: ChildCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ChildCollectionViewCell
        cell.sizeToFit()
        
        cell.imageView?.image = UIImage(named: "kb\(indexPath.row+1).png")
        cell.name?.text = "科比\(array[indexPath.row])"
        cell.number.text = "\(array[indexPath.row]).0万"
        cell.contact.text = "最后的王者\(array[indexPath.row])"
        return cell
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
