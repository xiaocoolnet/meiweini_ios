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
    let backArr:[String] = ["ic_dise_youzheng","ic_dise_zhaoshang","ic_dise_jianshe","ic_dise_zhongguo","ic_dise_nongye","ic_dise_huaxia","ic_dise_guangfa","ic_dise_jiaotong","ic_dise_xingye","ic_dise_zhongxin","ic_dise_pufa","ic_dise_guangda","ic_dise_minsheng","ic_dise_beijing","ic_dise_pingan"]
    let titImageArr:[String] = ["ic_youzheng","ic_zhaoshang","ic_jianshe","ic_zhongguo","ic_nongye","ic_huaxia","ic_guangfa","ic_jiaotong","ic_xingye","ic_zhongxin","ic_pufa","ic_guangda","ic_minsheng","ic_beijing","ic_pingan"]
    let backName:[String] = ["中国邮政储蓄银行","招商银行","中国建设银行","中国农业银行","中国银行","华夏银行","广发银行","交通银行","兴业银行","中信银行","上海浦发银行","中国光大银行","中国民生银行","北京银行","平安银行"]
    
    
    var myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "详情"
        
        self.view.backgroundColor = RGREY

        rightBtn = UIBarButtonItem(title: "编辑", style: .Done, target: self, action: #selector(DetailsViewController.goToEdit))
        
        self.navigationItem.rightBarButtonItem = rightBtn
        
        myTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64)
        myTableView.backgroundColor = UIColor.clearColor()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .None
        myTableView.registerClass(BankCardTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(myTableView)
        myTableView.rowHeight = 150
        
        print(backArr.count)
        print(backName.count)
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!BankCardTableViewCell
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.clearColor()
        cell.backImage.image = UIImage(named: backArr[indexPath.row])
        cell.titImage.image = UIImage(named: titImageArr[indexPath.row])
        cell.titLab.text = backName[indexPath.row]
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
