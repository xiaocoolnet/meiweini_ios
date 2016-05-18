//
//  DiamondPayViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class DiamondPayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let payFor = UIButton()
    var myTableView = UITableView()
    let style:[String] = ["中国工商银行储蓄卡（1123）","银行卡支付","支付宝支付","微信支付","余额支付"]
    let contant:[String] = ["已绑定银行卡，可直接支付。","支持储蓄卡信用卡，无需开通网银。","推荐有支付宝账户的用户使用。","推荐安装微信5.0及以上版本的用户使用。","可在我的账户充值，现在享受9折优惠。"]
    let titImage:[String] = ["工商银行支付.png","银行卡支付.png","支付宝.png","微信支付.png","余额支付.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "支付方式"
        
        self.view.backgroundColor = RGREY
        
        myTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(PayStyleTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.rowHeight = 70
        self.view.addSubview(myTableView)
        myTableView.backgroundColor = UIColor.clearColor()
        
        let view = UIView(frame: CGRectMake(0, 0, WIDTH, 59))
        let tit = UILabel()
        tit.backgroundColor = UIColor.whiteColor()
        tit.frame = CGRectMake(0, 15, WIDTH, 44)
        tit.textColor = UIColor(red: 244/255.0, green: 81/255.0, blue: 31/255.0, alpha: 1.0)
        tit.font = UIFont.systemFontOfSize(16)
        tit.textAlignment = .Center
        tit.text = "您将购买100钻石，需支付5元"
        view.addSubview(tit)
        let line = UILabel(frame: CGRectMake(0, 43.5, WIDTH, 0.5))
        line.backgroundColor = GREY
        view.addSubview(line)

        myTableView.tableHeaderView = view
        
        let viewfoot = UIView(frame: CGRectMake(0, 0, WIDTH, 80))
        viewfoot.backgroundColor = UIColor.clearColor()
        payFor.frame = CGRectMake(20, 20, WIDTH-40, 44)
        payFor.setBackgroundImage(UIImage(named: "xiaoyibu_pressed.png"), forState: .Normal)
        payFor.setBackgroundImage(UIImage(named: "xiaoyibu_selected.png"), forState: .Highlighted)
        payFor.addTarget(self, action: #selector(DiamondPayViewController.payForMoney), forControlEvents: .TouchUpInside)
        
        viewfoot.addSubview(payFor)
        myTableView.tableFooterView = viewfoot
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!PayStyleTableViewCell
        cell.selectionStyle = .None
        cell.titName.text = style[indexPath.row]
        cell.contant.text = contant[indexPath.row]
        cell.titImage.image = UIImage(named: titImage[indexPath.row])
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        
    }
    func payForMoney() {
        print("确认支付")
        
        
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
