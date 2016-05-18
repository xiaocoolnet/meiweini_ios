//
//  GetPresentsViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class GetPresentsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "收到的礼物"
        
        self.view.backgroundColor = RGREY
        
        myTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT)
        myTableView.backgroundColor = UIColor.clearColor()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(GiftsTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(myTableView)
        myTableView.rowHeight = 120
        
        // Do any additional setup after loading the view.
    }

//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 3
//    }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!GiftsTableViewCell
        cell.selectionStyle = .None
        cell.titName.text = "999朵玫瑰"
        cell.titLab.text = "江南飘雪"
        cell.timeLab.text = "于2016-05-14 13:50赠送"
        cell.gifts.setTitle("回赠TA礼物", forState: .Normal)
        cell.gifts.addTarget(self, action: #selector(GetPresentsViewController.gaveSomeGifts), forControlEvents: .TouchUpInside)
        return cell
        
    }
    
    func gaveSomeGifts() {
        print("回赠")
        
        
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
