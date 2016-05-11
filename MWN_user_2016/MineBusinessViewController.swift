//
//  MineBusinessViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineBusinessViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var myTableView = UITableView()
    let picArr:[String] = ["ic_liwu.png","ic_zuanshi.png"]
        
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我的分销"
        self.view.backgroundColor = RGREY
        
        myTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64)
        myTableView.backgroundColor = UIColor.clearColor()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(MineBusinessTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(myTableView)
        myTableView.rowHeight = 80
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
        
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!MineBusinessTableViewCell
        cell.selectionStyle = .None
        cell.titLab.text = "分享XXX的店铺页面到微信，获得xxx礼物一件"
        cell.timeLab.text = "2016-05-18 09:30"
        cell.titImage.image = UIImage(named: picArr[indexPath.section])
        
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
