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
        
        beautyTable.frame = CGRectMake(0, 0, WIDTH, HEIGHT)
        beautyTable.delegate = self
        beautyTable.dataSource = self
        beautyTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(beautyTable)

        
        downView.frame = CGRectMake(0, HEIGHT-114, WIDTH, 50)
        downView.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(downView)
        // Do any additional setup after loading the view.
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
                return 400
            }else{
                return 80
            }
        }else if indexPath.section == 1 {
            return 160
        }else{
            return 100
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 44
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 44
        }else{
            return 0
        }
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "类似推荐"
        }else if section == 2 {
            return "评论"
        }else{
            return ""
        }
    }
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 2 {
            return "没有更多了"
        }else{
            return ""
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "孤独和寂寞的差别是：孤独──你有的是热闹的选择，偶尔不选而已。很美很高冷。那种感觉，别人不懂，你也根本不介意别人懂不懂。寂寞──你没的选。总是很慌张很饥渴。那种不好的感觉，别人懂。但懂了也不在乎。"
        cell.textLabel?.numberOfLines = 0
        
        return cell
        
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
