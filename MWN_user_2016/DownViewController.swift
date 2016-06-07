//
//  DownViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class DownViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    var downTable = UITableView()
    let payNow = UIButton()
    let backView = UIView()
    let backLab = UIButton()
    let backview = UIView()
    var window = UIWindow()
    var password : ZSPasswordView?
    let sure = UIButton()
    var count = Int()
    var cont = Bool()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        self.automaticallyAdjustsScrollViewInsets = false

        self.view.backgroundColor = RGREY
        
        downTable.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64)
        downTable.backgroundColor = RGREY
        downTable.delegate = self
        downTable.dataSource = self
        downTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        downTable.registerClass(CommodityTableViewCell.self, forCellReuseIdentifier: "commodity")
        downTable.registerClass(PayTableViewCell.self, forCellReuseIdentifier: "pay")
        downTable.registerClass(MoreTableViewCell.self, forCellReuseIdentifier: "more")
        self.view.addSubview(downTable)
        
        
        let view = UIView(frame: CGRectMake(0, 0, WIDTH, 100))
        view.backgroundColor = RGREY
        payNow.frame = CGRectMake(WIDTH/24, 30, WIDTH/12*11, 44)
        payNow.setImage(UIImage(named: "lijizhifu_normal.png"), forState: .Normal)
        payNow.setImage(UIImage(named: "lijizhifu_pressed.png"), forState: .Highlighted)
        payNow.addTarget(self, action: #selector(DownViewController.payNowTheCommodity), forControlEvents: .TouchUpInside)
        view.addSubview(payNow)
        downTable.tableFooterView = view
        
        count = 2
        cont = true
        
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return count
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15
        }else{
            return 0
        }
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return (WIDTH-20)/5*3+95
        }else{
            if indexPath.row == count-1 {
                return 60
            }else{
                return 80
            }
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("commodity", forIndexPath: indexPath)as!CommodityTableViewCell
            cell.selectionStyle = .None
            cell.business.text = "商家：阿里巴巴"
            cell.commodity.image = UIImage(named: "kb1.png")
            cell.bus.text = "阿里巴巴"
            cell.RAM.text = "(大小 36M)"
            cell.price.text = "¥88.88"
            
            return cell
            
        }else{
            if indexPath.row == count-1 {
                let cell = tableView.dequeueReusableCellWithIdentifier("more")as!MoreTableViewCell
                cell.selectionStyle = .None
                cell.morePay.text = "更多支付方式"
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("pay")as!PayTableViewCell
                cell.selectionStyle = .None
                cell.payImage.image = UIImage(named: "ic_yinhangka.png")
                cell.payStyle.text = "中国建设银行储蓄卡 尾号8888"
                cell.paySmore.text = "已绑定银行卡直接支付"
                cell.selector.addTarget(self, action: #selector(DownViewController.selectorStyle(_:)), forControlEvents: .TouchUpInside)
                cell.selector.tag = indexPath.row
                
                return cell

            }
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let cell = tableView.cellForRowAtIndexPath(indexPath)as?MoreTableViewCell
        
        if indexPath.section == 1 {
            if indexPath.row == count-1 {
                print("更多支付方式")
                if cont {
                    count = 5
                    UIView.animateWithDuration(0.2, animations: {
//                        self.downTable.setContentOffset(CGPointMake(0, self.downTable.bounds.size.height), animated: true)
                        tableView.reloadData()
                        cell?.more.image = UIImage(named: "")
                    })
                    cont = !cont
                }else{
                    count = 2
                 UIView.animateWithDuration(0.2, animations: {
                        tableView.reloadData()
                        cell!.more.image = UIImage(named: "ic_jiangtou-down.png")
                    })
                    cont = !cont
                }
            }
        }
        
    }
    func selectorStyle(btn:UIButton) {
        print("选择支付方式")
        btn.setBackgroundImage(UIImage(named: "ic_xuanzhong.png"), forState: .Normal)
        
    }
    func payNowTheCommodity() {
        print("立即支付")
        
        backView.frame = CGRectMake(0, 0, WIDTH, HEIGHT+64)
        backLab.frame = CGRectMake(0, 0, WIDTH, HEIGHT+64)
        backLab.backgroundColor = UIColor.grayColor()
        backLab.alpha = 0.4
        backLab.addTarget(self, action: #selector(self.backButtonClick), forControlEvents: .TouchUpInside)
        backView.addSubview(backLab)
        backview.frame = CGRectMake(20, HEIGHT/2-80, WIDTH-40, 200)
        backview.backgroundColor = UIColor.whiteColor()
        backView.addSubview(backview)
        password = ZSPasswordView.init(frame: CGRectMake(10, 40, backview.bounds.size.width - 20, 40))
        password!.textFiled.delegate = self
        backview.addSubview(password!)
        sure.frame = CGRectMake(backview.bounds.size.width/2-50, 120, 100, 40)
        sure.layer.cornerRadius = 5
        sure.layer.borderColor = UIColor.blackColor().CGColor
        sure.layer.borderWidth = 0.5
        sure.setTitle("确定", forState: .Normal)
        sure.setTitleColor(UIColor.blackColor(), forState: .Normal)
        sure.addTarget(self, action: #selector(self.getOverThePassword), forControlEvents: .TouchUpInside)
        backview.addSubview(sure)
        
        
        window = ((UIApplication.sharedApplication().delegate?.window)!)!
        window.addSubview(backView)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyBoardChangFrame(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
        
    }
    func backButtonClick() {
        print("消失")
        backView.removeFromSuperview()
        
    }
    func keyBoardChangFrame(info:NSNotification) {
        let infoDic = info.userInfo
        let keyBoardRect = infoDic!["UIKeyboardFrameEndUserInfoKey"]?.CGRectValue()
        let keyBoardTranslate = CGFloat((keyBoardRect?.origin.y)!-212)
        
        UIView.animateWithDuration((infoDic!["UIKeyboardAnimationCurveUserInfoKey"]?.doubleValue)!, delay: 0, options: .TransitionNone, animations: {
            var rect:CGRect = self.backview.frame
            rect.origin.y = keyBoardTranslate
            self.backview.frame = rect
            
            }, completion: nil)
    }

    func getOverThePassword() {
        print(password!.textFiledString)
        password!.textFiled.resignFirstResponder()
        backView.removeFromSuperview()
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
