//
//  BusViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BusViewController: UIViewController {
    @IBOutlet weak var busName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var star: UILabel!
    @IBOutlet weak var chengJiao: UIButton!
    @IBOutlet weak var fangKe: UIButton!
    @IBOutlet weak var dingDan: UIButton!

    @IBOutlet weak var titleView: UIView!
    let setBtn = UIButton()
    var massageBtn = UIButton()
    
    override func viewWillAppear(animated: Bool) {
        titleView.backgroundColor = COLOR
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        
        setBtn.frame = CGRectMake(WIDTH-45, 30, 30, 30)
        setBtn.setImage(UIImage(named: "ic_set.png"), forState: .Normal)
        setBtn.addTarget(self, action: #selector(BusViewController.setUpView), forControlEvents: .TouchUpInside)
        
        massageBtn.frame = CGRectMake(WIDTH-100, 30, 40, 30)
        massageBtn.setTitle("消息", forState: .Normal)
        massageBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        massageBtn.addTarget(self, action: #selector(BusViewController.massageList), forControlEvents:.TouchUpInside)
        
        titleView.addSubview(setBtn)
        titleView.addSubview(massageBtn)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func personalMassage(sender: AnyObject) {
        print("个人信息修改")
        let userMassage = UserMassageViewController()
        self.navigationController?.pushViewController(userMassage, animated: true)
        userMassage.title = "信息修改"
        
    }
    func setUpView() {
        print("设置")
        let view = SetViewController()
        self.navigationController?.pushViewController(view, animated: true)
        
        
    }
    func massageList() {
        print("消息")
        let view = MineMassageViewController()
        self.navigationController?.pushViewController(view, animated: true)
        
        
    }
    @IBAction func todayChengJiao(sender: AnyObject) {
        print("今日成交")
        
    }
    
    @IBAction func todayFangKe(sender: AnyObject) {
        print("今日访客")
        
        
    }
    
    @IBAction func todayDingDan(sender: AnyObject) {
        print("今日订单")
        
    }
    
    @IBAction func goBack(sender: AnyObject) {
        
        let alertController = UIAlertController(title: NSLocalizedString("", comment: "Warn"), message: NSLocalizedString("确认注销？", comment: "empty message"), preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        let doneAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            //            let userid = NSUserDefaults.standardUserDefaults()
            //            userid.setValue("", forKey: "userid")
            //            let defalutid = NSUserDefaults.standardUserDefaults()
            //            defalutid.setValue("", forKey: "cid")
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginView") as! UINavigationController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
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
