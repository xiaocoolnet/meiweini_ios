//
//  SetViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class SetViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UMSocialUIDelegate {

    var getTableView = UITableView()
    let titArr:[String] = ["账号与安全","常用地址","服务条款","服务范围","用户反馈","关于我们","分享朋友"]
        
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
        self.title = "设置"
        self.view.backgroundColor = RGREY
        
        getTableView.frame = self.view.bounds
        getTableView.backgroundColor = UIColor.clearColor()
        getTableView.delegate = self
        getTableView.dataSource = self
        getTableView.separatorColor = RGREY
        getTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(getTableView)
        getTableView.rowHeight = 50
//        getTableView.scrollEnabled = false
        self.bottomView()
    }
//退出登录
    func bottomView() {
        let bottom = UIView(frame: CGRectMake(0, 0, WIDTH, 100))
        
        let back = UIButton(frame: CGRectMake(20, 40, WIDTH-40, 44))
        back.setImage(UIImage(named: "lijitijiao_normal-1"), forState: .Normal)
        back.addTarget(self, action: #selector(self.GoBackLogin), forControlEvents: .TouchUpInside)
        bottom.addSubview(back)
        getTableView.tableFooterView = bottom
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }else{
            return 5
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        if indexPath.section == 0 {
            cell.textLabel?.text = titArr[indexPath.row]
        }else{
            cell.textLabel?.text = titArr[indexPath.row+2]
        }
        
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let safe = SafeViewController()
                self.navigationController?.pushViewController(safe, animated: true)
            }else{
                let address = AddressListViewController(nibName: "AddressListViewController", bundle: nil)
                self.navigationController?.pushViewController(address, animated: true)
            }
            
            
        }else{
            
            if indexPath.row == 4 {
                UMSocialSnsService.presentSnsIconSheetView(self, appKey:"57468e9267e58ebf5e0029a3", shareText:"很好玩的小游戏,小时都玩过吧!https://github.com/c-shen", shareImage: UIImage(named:"icon.png"), shareToSnsNames: [UMShareToSina,UMShareToTencent,UMShareToWechatSession,UMShareToQzone,UMShareToQQ,UMShareToRenren], delegate: self)
            }else{
                let service = ServiceViewController()
                self.navigationController?.pushViewController(service, animated: true)
            }
            
        }
    }
//    退出登录
    func GoBackLogin() {
        
        let alertController = UIAlertController(title: NSLocalizedString("", comment: "Warn"), message: NSLocalizedString("确认退出？", comment: "empty message"), preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let doneAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginView") as! UINavigationController
            self.presentViewController(vc, animated: true, completion: nil)
            let userid = NSUserDefaults.standardUserDefaults()
            userid.removeObjectForKey("userid")
        }
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
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
