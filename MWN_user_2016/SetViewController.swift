//
//  SetViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class SetViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var getTableView = UITableView()
    let titArr:[String] = ["账号与安全","常用地址","服务条款","服务范围","用户反馈","关于我们","分享朋友"]
        
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "设置"
        self.view.backgroundColor = RGREY
        
        getTableView.frame = self.view.bounds
        getTableView.backgroundColor = UIColor.clearColor()
        getTableView.delegate = self
        getTableView.dataSource = self
        getTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(getTableView)
        getTableView.rowHeight = 50
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
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
            let safe = SafeViewController()
            self.navigationController?.pushViewController(safe, animated: true)
            
        }else{
            let service = ServiceViewController()
            self.navigationController?.pushViewController(service, animated: true)
            
        }
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
