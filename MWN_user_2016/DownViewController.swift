//
//  DownViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class DownViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var downTable = UITableView()
    let payNow = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = RGREY
        
        downTable.frame = self.view.bounds
        downTable.backgroundColor = RGREY
        downTable.delegate = self
        downTable.dataSource = self
        downTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        downTable.registerClass(CommodityTableViewCell.self, forCellReuseIdentifier: "commodity")
        downTable.registerClass(PayTableViewCell.self, forCellReuseIdentifier: "pay")
        downTable.registerClass(MoreTableViewCell.self, forCellReuseIdentifier: "more")
        self.view.addSubview(downTable)
        
        
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 2
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15
        }else{
            return 100
        }
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView()
            view.backgroundColor = RGREY
            return view
        }else{
            let view = UIView()
            view.backgroundColor = RGREY
            payNow.frame = CGRectMake(WIDTH/24, 30, WIDTH/12*11, 44)
            payNow.setImage(UIImage(named: "lijizhifu_normal.png"), forState: .Normal)
            payNow.setImage(UIImage(named: "lijizhifu_pressed.png"), forState: .Highlighted)
            payNow.addTarget(self, action: #selector(DownViewController.payNowTheCommodity), forControlEvents: .TouchUpInside)
            view.addSubview(payNow)
            
            return view
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return (WIDTH-20)/5*3+95
        }else{
            if indexPath.row == 0 {
                return 80
            }else{
                return 60
            }
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("commodity", forIndexPath: indexPath)as!CommodityTableViewCell
            cell.selectionStyle = .None
            cell.business.text = "商家：阿里巴巴"
            cell.commodity.image = UIImage(named: "kb1.png")
            cell.bus.text = "阿里巴巴"
            cell.RAM.text = "(大小 36M)"
            cell.price.text = "$88.88"
            
            return cell
            
        }else{
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("pay")as!PayTableViewCell
                cell.selectionStyle = .None
                cell.payImage.image = UIImage(named: "ic_yinhangka.png")
                cell.payStyle.text = "中国建设银行储蓄卡 尾号8888"
                cell.paySmore.text = "已绑定银行卡直接支付"
                cell.selector.addTarget(self, action: #selector(DownViewController.selectorStyle), forControlEvents: .TouchUpInside)
                
                return cell
                
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("more")as!MoreTableViewCell
                cell.selectionStyle = .None
                cell.morePay.text = "更多支付方式"
                
                return cell
                
            }
        }
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if indexPath.section == 1 {
            if indexPath.row == 1 {
                print("更多支付方式")
                
                
            }
        }
        
    }
    func selectorStyle() {
        print("选择支付方式")
        
        
    }
    func payNowTheCommodity() {
        print("立即支付")
        
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
