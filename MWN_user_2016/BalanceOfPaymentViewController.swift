//
//  BalanceOfPaymentViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BalanceOfPaymentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var myTableView = UITableView()
    let titArr:[String] = ["充值","提现"]
    let timeArr:[String] = ["2016-05-25 16:00","2016-05-23 14:00"]
    let moneyArr:[String] = ["+100.00","-100.00"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RGREY
        
        myTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64)
        myTableView.backgroundColor = UIColor.clearColor()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(TransationTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.rowHeight = 60
        self.view.addSubview(myTableView)
        
        let view = UIView(frame: CGRectMake(0, 0, WIDTH, 10))
        myTableView.tableHeaderView = view
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!TransationTableViewCell
        cell.selectionStyle = .None
        cell.titLab.text = titArr[indexPath.row]
        cell.timeLab.text = timeArr[indexPath.row]
        cell.moneyLab.text = moneyArr[indexPath.row]
        
        return cell
        
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
