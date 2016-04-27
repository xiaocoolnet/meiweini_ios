//
//  MineViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var titleView: UIView!
    
    let setBtn = UIButton()
    var massageBtn = UIButton()
    
    let titConcern = UILabel()
    let titRed = UILabel()
    
    var concernBtn = UIButton()
    var redBtn = UIButton()
    
    var myTableView = UITableView()
    let titArr:[String] = ["我的购买","我的分销","我的账户","我的地址"]
    let picArr:[String] = ["ic_goumai.png","ic_fenxiao.png","ic_wodeqiangui.png","ic_dizhi.png"]
    
    
    
    override func viewWillAppear(animated: Bool) {
        titleView.backgroundColor = COLOR
        self.navigationController?.navigationBarHidden = true
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        backBtn.layer.cornerRadius = 25
        
        setBtn.frame = CGRectMake(WIDTH-45, 30, 30, 30)
        setBtn.setImage(UIImage(named: "ic_set.png"), forState: .Normal)
        setBtn.addTarget(self, action: #selector(MineViewController.setUpView), forControlEvents: .TouchUpInside)
        
        massageBtn.frame = CGRectMake(WIDTH-100, 30, 40, 30)
        massageBtn.setTitle("消息", forState: .Normal)
        massageBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        massageBtn.addTarget(self, action: #selector(MineViewController.massageList), forControlEvents:.TouchUpInside)
        
        titConcern.frame = CGRectMake(0, 250, WIDTH/2-1, 50)
        titConcern.backgroundColor = UIColor(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1.0)
        titConcern.alpha = 0.3
        titRed.frame = CGRectMake(WIDTH/2, 250, WIDTH/2, 50)
        titRed.backgroundColor = UIColor(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1.0)
        titRed.alpha = 0.3
        concernBtn.frame = CGRectMake(0, 250, WIDTH/2, 50)
        concernBtn.setTitle("关注12", forState: .Normal)
        concernBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        concernBtn.addTarget(self, action: #selector(MineViewController.concernList), forControlEvents: .TouchUpInside)
        redBtn.frame = CGRectMake(WIDTH/2, 250, WIDTH/2, 50)
        redBtn.setTitle("红包3", forState: .Normal)
        redBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        redBtn.addTarget(self, action: #selector(MineViewController.redenvelopeList), forControlEvents: .TouchUpInside)
        
        titleView.addSubview(setBtn)
        titleView.addSubview(massageBtn)
        titleView.addSubview(titConcern)
        titleView.addSubview(titRed)
        titleView.addSubview(concernBtn)
        titleView.addSubview(redBtn)
        
        myTableView.frame = CGRectMake(0, 280, WIDTH, 260)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(MineOneTableViewCell.self, forCellReuseIdentifier: "one")
        myTableView.registerClass(MineTwoTableViewCell.self, forCellReuseIdentifier: "two")
        myTableView.scrollEnabled = false
        self.view.addSubview(myTableView)
        
        myTableView.rowHeight = 60
        
    }
    
    func setUpView () {
        print("设置")
        let view = SetViewController()
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func massageList () {
        print("消息")
        let view = MineMassageViewController()
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func concernList() {
        print("关注")
        let view = MineConcernViewController()
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func redenvelopeList() {
        print("红包")
        let view = MineRedViewController()
        self.navigationController?.pushViewController(view, animated: true)
        
    }

    //    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        return 6
    //    }
    //
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("one")as!MineOneTableViewCell
        if indexPath.row == 0 {
            
            cell.selectionStyle = .None
            cell.titImage.image = UIImage(named: picArr[0])
            cell.titLab.text = titArr[0]
            
            return cell
            
        }else if indexPath.row == 1 {
            
            cell.selectionStyle = .None
            cell.titImage.image = UIImage(named: picArr[1])
            cell.titLab.text = titArr[1]
            
            return cell
        }else if indexPath.row == 2 {
            
            cell.selectionStyle = .None
            cell.titImage.image = UIImage(named: picArr[2])
            cell.titLab.text = titArr[2]
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("two")as!MineTwoTableViewCell
            cell.selectionStyle = .None
            cell.titImage.image = UIImage(named: picArr[3])
            cell.titLab.text = titArr[3]
            cell.address.text = "山东省烟台市"
            return cell

        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("我的\(indexPath.row)")
        if indexPath.row == 0 {
            
            let viewOne = MineBuyViewController()
            self.navigationController?.pushViewController(viewOne, animated: true)
            
        }else if indexPath.row == 1 {
            
            let business = MineBusinessViewController()
            self.navigationController?.pushViewController(business, animated: true)
            
        }else if indexPath.row == 2 {
            
            let account = MineAccountViewController()
            self.navigationController?.pushViewController(account, animated: true)
            
        }else{
            let viewTwo = MineAddressViewController()
            self.navigationController?.pushViewController(viewTwo, animated: true)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeImage(sender: AnyObject) {
        print("信息修改")
        let userMassage = UserMassageViewController()
        self.navigationController?.pushViewController(userMassage, animated: true)
        userMassage.title = "信息修改"
        
        
    }
    
    @IBAction func GoBackLogin(sender: AnyObject) {
        
        let alertController = UIAlertController(title: NSLocalizedString("", comment: "Warn"), message: NSLocalizedString("确认注销？", comment: "empty message"), preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let doneAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
//            let userid = NSUserDefaults.standardUserDefaults()
//            userid.setValue("", forKey: "userid")
//            let defalutid = NSUserDefaults.standardUserDefaults()
//            defalutid.setValue("", forKey: "cid")
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginView") as! UINavigationController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)

        
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
