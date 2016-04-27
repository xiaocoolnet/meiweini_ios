//
//  BeautyVidViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BeautyVidViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let reuseIdentifier = "videoCell"
    
    var videoTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        videoTable.frame = CGRectMake(0, 0, WIDTH, HEIGHT-154)
        videoTable.delegate = self
        videoTable.dataSource = self
        videoTable.backgroundColor = RGREY
        
        videoTable.registerClass(VideoTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.view.addSubview(videoTable)
        
    }
//collection的组数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
//组头的宽度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
//每组的单元格个数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
//    单元格高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 240
    }
//    单元格内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)as!VideoTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.anchorImage.image = UIImage(named: "kb2.png")
        cell.anchorName.text = "科比 布莱恩特"
        cell.zanNumber.text = "2134"
        cell.downNumber.text = "2341"
        cell.downBtn.addTarget(self, action: #selector(BeautyVidViewController.downLoadUp), forControlEvents: .TouchUpInside)
        cell.zanBtn.addTarget(self, action: #selector(BeautyVidViewController.zanButtonUp), forControlEvents: .TouchUpInside)
       
        return cell
    }
// 但愿个点击方法
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let video = VideoViewController()
        self.navigationController?.pushViewController(video, animated: true)
        
        
    }
    func zanButtonUp() {
        print("赞")
        
        
    }
    func downLoadUp() {
        print("下载")
        
        
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
