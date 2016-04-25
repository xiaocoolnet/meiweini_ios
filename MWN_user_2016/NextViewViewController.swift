//
//  NextViewViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class NextViewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var beautyTable = UITableView()
    let downView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.hidden = true
        self.title = "商品界面"
        self.view.backgroundColor = RGREY
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "ic_shanghu.png"), style: .Done, target: self, action: #selector(NextViewViewController.shareBtn))
        self.navigationItem.rightBarButtonItem = rightItem
        
        beautyTable.frame = CGRectMake(0, 0, WIDTH, HEIGHT-58)
        beautyTable.delegate = self
        beautyTable.dataSource = self
        beautyTable.registerClass(CommentTableViewCell.self, forCellReuseIdentifier: "comment")
        beautyTable.registerClass(PhotoalbumTableViewCell.self, forCellReuseIdentifier: "photoalbum")
        beautyTable.registerClass(PhotoTableViewCell.self, forCellReuseIdentifier: "photo")
        beautyTable.registerClass(RecommendTableViewCell.self, forCellReuseIdentifier: "recommend")
        self.view.addSubview(beautyTable)

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
        let focusLab = UILabel()
        focusLab.frame = CGRectMake(35, 12, 40, 20)
        focusLab.text = "关注"
        let focusBtn = UIButton()
        focusBtn.frame = CGRectMake(5, 2, 70, 40)
        focusBtn.addTarget(self, action: #selector(NextViewViewController.focusTheBeauty), forControlEvents: .TouchUpInside)
        downView.addSubview(focus)
        downView.addSubview(focusLab)
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
        let commentLab = UILabel()
        commentLab.frame = CGRectMake(WIDTH-75, 12, 40, 20)
        commentLab.text = "评论"
        commentLab.textAlignment = .Right
        let commentBtn = UIButton()
        commentBtn.frame = CGRectMake(WIDTH-75, 2, 70, 40)
        commentBtn.addTarget(self, action: #selector(NextViewViewController.commentTheBeauty), forControlEvents: .TouchUpInside)
        downView.addSubview(comment)
        downView.addSubview(commentLab)
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
        
    }
    func shareBtn() {
        print("分享")
        
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
            return 160
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
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 40
        }else{
            return 0
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
        headView.backgroundColor = RGREY
        return headView
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        let prompt = UILabel()
        prompt.frame = CGRectMake(WIDTH/4, 10, WIDTH/2, 20)
        prompt.font = UIFont.systemFontOfSize(14)
        prompt.textColor = GREY
        prompt.text = "没有更多了"
        prompt.textAlignment = .Center
        footView.addSubview(prompt)
        footView.backgroundColor = RGREY
        return footView
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("photo")as!PhotoTableViewCell
                cell.selectionStyle = .None
                cell.photoImage.image = UIImage(named: "kb4.png")
                cell.photoNum.text = "1/8"
                
                return cell
                
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("photoalbum")as!PhotoalbumTableViewCell
                cell.selectionStyle = .None
                cell.photoName.text = "美女相册"
                cell.price.text = "$88.88"
                cell.comment.text = "勇敢是，当你还未开始就已知道自己会输，可你依然要去做，而且无论如何都要把它坚持到底。"
                return cell
                
            }
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("recommend")as!RecommendTableViewCell
            cell.selectionStyle = .None
            cell.textLabel?.text = "路飞：白痴我根本就不会剑术 而且我也不会航海更不会做菜 也不会说谎！ 如果没有他们帮助，我根本活不下去！ 恶龙：很少会这样全面否定自己的…有你这样无能的船长，做你的伙伴一定很累吧？ 为什么你的伙伴会拼命想救你呢？ 什么都不会的你，凭什么当一船船长？你到底能做什么？ 路飞：我可以打赢你！"
            cell.textLabel?.numberOfLines = 0
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("comment", forIndexPath: indexPath)as!CommentTableViewCell
            cell.selectionStyle = .None
            cell.userImage.image = UIImage(named: "kb1.png")
            cell.userName.text = "长风落叶"
            cell.userComment.text = "你就是那种看到脆弱不会飞的雏鸟就想帮它飞翔，抛出去之后就沉浸在自我满足中的人吧？这种人最差劲了。当你得意洋洋地离开之后，小鸟就会掉到柏油路上摔死，可是你却根本不会发现。耍笨也要有个限度。"
            cell.userDate.text = "4月25日"
            cell.zanNum.text = "235"
            cell.comment.text = "345"
            
            return cell
            
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        
        
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
