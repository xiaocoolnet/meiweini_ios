//
//  PersonCertificationViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PersonCertificationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var certification: UIButton!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var sheying: UIButton!
    var sheyingLab = UILabel()
    var meizhuang = UIButton()
    var meizhuangLab = UILabel()
    var meija = UIButton()
    var meijaiLab = UILabel()
    var meirong = UIButton()
    var meirongLab = UILabel()
    var more = UIButton()
    var moreLab = UILabel()
    @IBOutlet weak var backGound: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = RGREY
        
        name.delegate = self
        phoneNum.delegate = self
        
        sheyingLab.frame = CGRectMake(84, 158, (WIDTH-140)/5, 21)
        sheyingLab.font = UIFont.systemFontOfSize(13)
        sheyingLab.textAlignment = .Center
        sheyingLab.text = "摄影师"
        meizhuang.frame = CGRectMake(84+(WIDTH-140)/5, 162, 14, 14)
        meizhuang.tag = 2
        meizhuang.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        meizhuang.addTarget(self, action: #selector(PersonCertificationViewController.selectorTheWork(_:)), forControlEvents: .TouchUpInside)
        meizhuangLab.frame = CGRectMake(84+(WIDTH-140)/5+14, 158, (WIDTH-140)/5, 21)
        meizhuangLab.font = UIFont.systemFontOfSize(13)
        meizhuangLab.textAlignment = .Center
        meizhuangLab.text = "模特"
        meija.frame = CGRectMake(84+(WIDTH-140)/5*2+14, 162, 14, 14)
        meija.tag = 3
        meija.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        meija.addTarget(self, action: #selector(PersonCertificationViewController.selectorTheWork(_:)), forControlEvents: .TouchUpInside)
        meijaiLab.frame = CGRectMake(84+(WIDTH-140)/5*2+28, 158, (WIDTH-140)/5, 21)
        meijaiLab.font = UIFont.systemFontOfSize(13)
        meijaiLab.textAlignment = .Center
        meijaiLab.text = "化妆师"
        meirong.frame = CGRectMake(84+(WIDTH-140)/5*3+28, 162, 14, 14)
        meirong.tag = 4
        meirong.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        meirong.addTarget(self, action: #selector(PersonCertificationViewController.selectorTheWork(_:)), forControlEvents: .TouchUpInside)
        meirongLab.frame = CGRectMake(84+(WIDTH-140)/5*3+42, 158, (WIDTH-140)/5, 21)
        meirongLab.font = UIFont.systemFontOfSize(13)
        meirongLab.textAlignment = .Center
        meirongLab.text = "美甲师"
        more.frame = CGRectMake(WIDTH-(WIDTH-140)/5-14, 162, 14, 14)
        more.tag = 5
        more.setImage(UIImage(named: "ic_xuanzhong-kong.png"), forState: .Normal)
        more.addTarget(self, action: #selector(PersonCertificationViewController.selectorTheWork(_:)), forControlEvents: .TouchUpInside)
        moreLab.frame = CGRectMake(WIDTH-(WIDTH-140)/5, 158, (WIDTH-140)/5, 21)
        moreLab.font = UIFont.systemFontOfSize(13)
        moreLab.textAlignment = .Center
        moreLab.text = "更多"
        
        backGound.addSubview(sheyingLab)
        backGound.addSubview(meizhuang)
        backGound.addSubview(meizhuangLab)
        backGound.addSubview(meija)
        backGound.addSubview(meijaiLab)
        backGound.addSubview(meirong)
        backGound.addSubview(meirongLab)
        backGound.addSubview(moreLab)
        backGound.addSubview(more)
        
        certification.setImage(UIImage(named: "lijitijiao_pressed.png"), forState: .Highlighted)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func selectorTheWork(sender: AnyObject) {
        print("选择\(sender.tag)")
        
        
    }
    
    @IBAction func personCertification(sender: AnyObject) {
        print("提交")
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("触摸")
        phoneNum.resignFirstResponder()
        name.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
