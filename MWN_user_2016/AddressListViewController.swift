//
//  AddressListViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class AddressListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var addressArr:[String] = ["查令街八十三号","查令街八十四号","查令街八十五号","查令街八十六号"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.edgesForExtendedLayout = .None
        self.automaticallyAdjustsScrollViewInsets = false
        
        let rightBtn = UIBarButtonItem(title: "添加", style: .Done, target: self, action: #selector(AddressListViewController.addAddress))
        
        self.navigationItem.rightBarButtonItem = rightBtn

        self.title = "地址列表"
        myTableView.backgroundColor = RGREY
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .None
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.rowHeight = 70
        
        // Do any additional setup after loading the view.
    }
    func addAddress() {
        let add = "查令街八十四号"
        addressArr.append(add)
        myTableView.reloadData()
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return addressArr.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.selectionStyle = .None
        cell?.accessoryType = .DisclosureIndicator
        cell?.textLabel?.text = addressArr[indexPath.section]
        
        return cell!
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
