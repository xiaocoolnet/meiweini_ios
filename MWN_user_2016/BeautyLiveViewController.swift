//
//  BeautyLiveViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BeautyLiveViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let reuseIdentifier = "liveCell"
    
    var liveTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        liveTable.frame = CGRectMake(0, 0, WIDTH, HEIGHT-154)
        liveTable.delegate = self
        liveTable.dataSource = self
        liveTable.registerClass(LiveTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.view.addSubview(liveTable)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 305
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)as!LiveTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.anchorImage.image = UIImage(named: "kb2.png")
        cell.anchorName.text = "科比 布莱恩特"
        cell.userImage.image = UIImage(named: "kb1.png")
        cell.location.text = "烟台市"
        cell.number.text = "2345"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let next = NextViewViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
        
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
