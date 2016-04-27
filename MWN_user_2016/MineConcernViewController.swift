//
//  MineConcernViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineConcernViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var concernTable = UITableView()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "我的关注"
        self.view.backgroundColor = UIColor.whiteColor()
        
        concernTable.frame = self.view.bounds
        concernTable.backgroundColor = RGREY
        concernTable.delegate = self
        concernTable.dataSource = self
        concernTable.registerClass(ConcernTableViewCell.self, forCellReuseIdentifier: "cell")
        concernTable.registerClass(ConcernListTableViewCell.self, forCellReuseIdentifier: "concern")
        
        self.view.addSubview(concernTable)

    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        }else{
            return 110
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!ConcernTableViewCell
            cell.selectionStyle = .None
            cell.busName.text = "心想事成工作室"
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("concern", forIndexPath: indexPath)as!ConcernListTableViewCell
            cell.selectionStyle = .None
            cell.busImage.image = UIImage(named: "kb2.png")
            cell.commom.text = "眼泪这东西啊，是流出来就能把辛酸和悲伤都冲走的好东西。可等你们长大成人了就会明白，人生还有眼泪也冲刷不干净的巨大悲伤，还有难忘的痛苦让你们即使想哭也不能流泪，所以真正坚强的人，都是越想哭反而笑得越大声，怀揣着痛苦和悲伤，即使如此也要带上它们笑着前行。"
            cell.dateLab.text = "2016-04-28"
            
            return cell
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("关注商品")
        
        
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
