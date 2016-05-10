//
//  DetailsViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var rightBtn = UIBarButtonItem()
    
    var myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "详情"
        
        self.view.backgroundColor = RGREY

        rightBtn = UIBarButtonItem(title: "编辑", style: .Done, target: self, action: #selector(DetailsViewController.goToEdit))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        myTableView.frame = self.view.bounds
        myTableView.backgroundColor = UIColor.clearColor()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(BankCardTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(myTableView)
        myTableView.rowHeight = 150
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!BankCardTableViewCell
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.clearColor()
        cell.backView.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(255))/255.0, green: CGFloat(arc4random_uniform(255))/255.0, blue: CGFloat(arc4random_uniform(255))/255.0, alpha: 1.0)
        
        
        return cell
        
    }
    func unwrapTheCard() {
        print("解绑")
        
        
    }
    func goToEdit() {
        print("编辑")
        rightBtn.title = "完成"
        rightBtn.enabled = false
        
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
