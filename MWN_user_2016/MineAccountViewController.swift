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
        self.automaticallyAdjustsScrollViewInsets = false

        self.title = "我的账户"
        self.view.backgroundColor = RGREY
        
        let rightBtn = UIBarButtonItem(title: "交易记录", style: .Done, target: self, action: #selector(MineAccountViewController.accountTheView))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        accountTable.frame = CGRectMake(0, 0, WIDTH, HEIGHT-15)
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
        
        
        if indexPath.section == 0 {
            cell.money.text = "00.00"
            cell.withdraw.setTitle(btnTit[4], forState: .Normal)
            cell.withdraw.addTarget(self, action: #selector(MineAccountViewController.withDrawMoney), forControlEvents: .TouchUpInside)
            cell.recharge.addTarget(self, action: #selector(MineAccountViewController.nextView), forControlEvents: .TouchUpInside)
            
        }else if indexPath.section == 1 {
            cell.money.text = "3张"
            cell.withdraw.setTitle(btnTit[5], forState: .Normal)
            cell.withdraw.addTarget(self, action: #selector(MineAccountViewController.detailsTheCard), forControlEvents: .TouchUpInside)
            cell.recharge.addTarget(self, action: #selector(MineAccountViewController.addBankCard), forControlEvents: .TouchUpInside)
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("diamond")as!DiamondTableViewCell
            cell.selectionStyle = .None
            cell.money.text = "1000"
            cell.title.text = titArr[indexPath.section]
            cell.titPic.image = UIImage(named: titArr[indexPath.section])
            cell.recharge.setTitle(btnTit[indexPath.section], forState: .Normal)
            cell.recharge.addTarget(self, action: #selector(MineAccountViewController.damindRecharge), forControlEvents: .TouchUpInside)
            return cell
        }else{
            cell.money.text = "23"
            cell.withdraw.setTitle(btnTit[6], forState: .Normal)
            cell.withdraw.addTarget(self, action: #selector(MineAccountViewController.giftGive), forControlEvents: .TouchUpInside)
            cell.recharge.addTarget(self, action: #selector(MineAccountViewController.getPresent), forControlEvents: .TouchUpInside)
        }
        
        return cell
        
    }
    func nextView() {
        print("充值")
        let next = OneViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
        
    }
    func withDrawMoney() {
        print("提现")
        let next = WithdrawViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    func damindRecharge() {
        print("钻石充值")
        let next = RechargeViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    func addBankCard() {
        print("添加银行卡")
        let next = BankCardViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    func detailsTheCard() {
        print("解绑")
        let next = DetailsViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
        
    }
    func getPresent() {
        print("收到的礼物")
        let next = GetPresentsViewController()
        self.navigationController?.pushViewController(next, animated: true)
        

    }
    func giftGive() {
        print("送出的礼物")
        let next = GiftsViewController()
        self.navigationController?.pushViewController(next, animated: true)
        

    }
    func accountTheView() {
        print("列表")
        let next = TransactionViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
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
