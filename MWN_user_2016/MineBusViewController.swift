//
//  MineBusViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineBusViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var myBusiness = UITableView()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        myBusiness.frame = self.view.bounds
        myBusiness.backgroundColor = RGREY
        myBusiness.delegate = self
        myBusiness.dataSource = self
        myBusiness.registerClass(MineBusTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(myBusiness)
        myBusiness.rowHeight = 110
        
        let view = UIView(frame: CGRectMake(0, 0, WIDTH, 50))
        view.backgroundColor = UIColor.clearColor()
        let prompt = UILabel(frame: CGRectMake(WIDTH/2-50, 0, 100, 50))
        prompt.font = UIFont.systemFontOfSize(13)
        prompt.textColor = GREY
        prompt.textAlignment = .Center
        prompt.text = "没有更多了"
        view.addSubview(prompt)
        myBusiness.tableFooterView = view
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!MineBusTableViewCell
        cell.selectionStyle = .None
        cell.busName.text = "虞美人长满的山坡"
        cell.dateLab.text = "2016-04-28 17:30"
        cell.price.text = "¥88.88"
        cell.busNum.text = "已售：12"
        cell.busImage.image = UIImage(named: "kb4.png")
        cell.busCommon.text = "尽管命运跟我们开了玩笑，尽管现实无法改变，我拥抱这命运，接受这现实，并仍旧喜欢着你。"
        cell.edit.addTarget(self, action: #selector(MineBusViewController.editingTheBusiness), forControlEvents: .TouchUpInside)
        
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let buiness = NextViewViewController()
        self.navigationController?.pushViewController(buiness, animated: true)
        
    }
    
    func editingTheBusiness() {
        print("编辑")
        
        
    }
   
    @IBAction func getUpTheBusniess(sender: AnyObject) {
        print("添加")
        
        
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
