//
//  BuyListViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BuyListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var buyTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = RGREY
        
        buyTable.frame = self.view.bounds
        buyTable.backgroundColor = RGREY
        buyTable.delegate = self
        buyTable.dataSource = self
        buyTable.registerClass(BuyListTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(buyTable)
        
        buyTable.rowHeight = 140
        
//        buyTable.scrollEnabled = false
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!BuyListTableViewCell
        cell.selectionStyle = .None
        cell.busName.text = "四月是你的谎言"
        cell.staly.text = "进行中"
        cell.dateLab.text = "2016-04-28 17:30"
        cell.price.text = "$88.88"
        cell.busNum.text = "已售：12"
        cell.busImage.image = UIImage(named: "kb4.png")
        cell.busCommon.text = "和他相遇的瞬间，我的人生就改变了。所见所闻所感，目之所及全都开始变得多姿多彩起来，全世界，都开始发光发亮！"
        cell.textLabel?.numberOfLines = 0
        cell.cancel.addTarget(self, action: #selector(BuyListViewController.cancalOrder), forControlEvents: .TouchUpInside)
        cell.pay.addTarget(self, action: #selector(BuyListViewController.payFor), forControlEvents: .TouchUpInside)
        
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("四月是你的谎言")
        
        
    }
    func cancalOrder() {
        print("取消订单")
        
    }
    func payFor() {
        print("去付款")
        
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
