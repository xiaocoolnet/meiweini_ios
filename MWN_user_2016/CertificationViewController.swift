//
//  CertificationViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class CertificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var businessTable = UITableView()
    var headArr:[String] = ["营业身份","营业信息","个人信息"]
    let styleArr:[String] = ["我是企业","我是个人"]
    var massArr:[String] = ["营业信息"]
    let personArr:[String] = ["姓名","身份证号码","身份证照片"]
    let nake = UIImageView()
    let nakeOne = UIImageView()
    var count = Int()
    var cou = Int()
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        businessTable.frame = self.view.bounds
        businessTable.backgroundColor = RGREY
        businessTable.delegate = self
        businessTable.dataSource = self
        businessTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(businessTable)
        count = 1
        cou = 3
        
        // Do any additional setup after loading the view.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }else if section == 1 {
            return count
        }else{
            return cou
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        let headLab = UILabel(frame: CGRectMake(13, 5, 100, 30))
        headLab.font = UIFont.systemFontOfSize(13)
        headLab.textColor = UIColor.grayColor()
        headLab.text = headArr[section]
        view.addSubview(headLab)
        return view
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.selectionStyle = .None
        if indexPath.section == 0 {
            cell.textLabel?.text = styleArr[indexPath.row]
            if indexPath.row == 0 {
                nake.frame = CGRectMake(WIDTH-30, 16, 15, 12)
                nake.image = UIImage(named: "ic_duigou.png")
                cell.addSubview(nake)
               
            }else{
                nakeOne.frame = CGRectMake(WIDTH-30, 16, 15, 12)
                nakeOne.image = UIImage(named: "ic_duigou.png")
                cell.addSubview(nakeOne)
            }
            
        }
        if indexPath.section == 1 {
            if count == 1 {
                cell.textLabel?.text = massArr[0]
            }else{
                cell.textLabel?.text = massArr[indexPath.row]
            }
        }
        if indexPath.section == 2 {
            if cou == 3 {
                cell.textLabel?.text = personArr[indexPath.row]
                if indexPath.row == 2 {
                    cell.accessoryType = .DisclosureIndicator
                }
            }
        }
        
        return cell
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                count = 6
                massArr = ["工商注册号","公司名称","营业范围","营业地址","营业执照","店铺图片"]
                cou = 0
                headArr = ["营业身份","营业信息",""]
                nake.hidden = false
                nakeOne.hidden = true
                tableView.reloadData()
            }else{
                count = 1
                massArr = ["营业范围"]
                cou = 3
                headArr = ["营业身份","营业信息","个人信息"]
                nake.hidden = true
                nakeOne.hidden = false
                tableView.reloadData()
            }
        }
        if indexPath.section == 1 {
            if indexPath.row == 5 {
                let photo = ShopPhotosViewController()
                self.navigationController?.pushViewController(photo, animated: true)
                
            }
        }
        if indexPath.section == 2 {
            if indexPath.row == 2 {
                let Card = IDcardViewController()
                self.navigationController?.pushViewController(Card, animated: true)
                
            }
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
