//
//  MineAccountViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineAccountViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var accountTable = UITableView()
    let titArr:[String] = ["余额","银行卡","钻石","礼物"]
    let btnTit:[String] = ["充值","添加银行卡","充值","收到的礼物","提现","解绑","送出的礼物"]
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我的账户"
        self.view.backgroundColor = RGREY
        
        let rightBtn = UIBarButtonItem(image: UIImage(named: "菜单.png"), style: .Done, target: self, action: #selector(MineAccountViewController.accountTheView))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        accountTable.frame = self.view.bounds
        accountTable.backgroundColor = RGREY
        accountTable.delegate = self
        accountTable.dataSource = self
        accountTable.registerClass(AccountTableViewCell.self, forCellReuseIdentifier: "cell")
        accountTable.registerClass(DiamondTableViewCell.self, forCellReuseIdentifier: "diamond")
        self.view.addSubview(accountTable)
        
        accountTable.rowHeight = 144
        
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")as!AccountTableViewCell
        cell.selectionStyle = .None
        cell.title.text = titArr[indexPath.section]
        cell.titPic.image = UIImage(named: titArr[indexPath.section])
        cell.recharge.setTitle(btnTit[indexPath.section], forState: .Normal)
        cell.recharge.addTarget(self, action: #selector(MineAccountViewController.nextView), forControlEvents: .TouchUpInside)
        
        if indexPath.section == 0 {
            cell.money.text = "00.00"
            cell.withdraw.setTitle(btnTit[4], forState: .Normal)
            cell.withdraw.addTarget(self, action: #selector(MineAccountViewController.nextView), forControlEvents: .TouchUpInside)
            
        }else if indexPath.section == 1 {
            cell.money.text = "3张"
            cell.withdraw.setTitle(btnTit[5], forState: .Normal)
            cell.withdraw.addTarget(self, action: #selector(MineAccountViewController.nextView), forControlEvents: .TouchUpInside)
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("diamond")as!DiamondTableViewCell
            cell.selectionStyle = .None
            cell.money.text = "1000"
            cell.title.text = titArr[indexPath.section]
            cell.titPic.image = UIImage(named: titArr[indexPath.section])
            cell.recharge.setTitle(btnTit[indexPath.section], forState: .Normal)
            cell.recharge.addTarget(self, action: #selector(MineAccountViewController.nextView), forControlEvents: .TouchUpInside)
            return cell
        }else{
            cell.money.text = "23"
            cell.withdraw.setTitle(btnTit[6], forState: .Normal)
            cell.withdraw.addTarget(self, action: #selector(MineAccountViewController.nextView), forControlEvents: .TouchUpInside)
        }
        
        return cell
        
    }
    func nextView() {
        print("下一页")
        let next = OneViewController()
        self.navigationController?.pushViewController(next, animated: true)
        next.title = "充值"
        
    }
    func accountTheView() {
        print("列表")
        
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
