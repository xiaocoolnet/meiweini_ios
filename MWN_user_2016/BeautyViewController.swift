//
//  BeautyViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import PagingMenuController

class BeautyViewController: UIViewController {

    let oneView = BeautyPicViewController()
    let twoView = BeautyVidViewController()
    let threeView = BeautyLiveViewController()
    
    let listView = UIView()
    let nameArr:[String] = ["美妆","美甲","摄影","更多"]
    let imageArr:[String] = ["美妆.png","美甲.png","摄影.png","更多.png"]
    
    var hidden = Bool()
    
    override func viewWillAppear(animated: Bool) {
        hidden = false
        listView.frame = CGRectMake(WIDTH-150, -200, 120, 160)
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = RGREY
        
        oneView.title = "美图"
        twoView.title = "视频"
        threeView.title = "直播"
        let viewControllers = [oneView,twoView,threeView]
        let options = PagingMenuOptions()
        options.menuItemMargin = 5
        options.menuHeight = 40
        options.menuDisplayMode = .SegmentedControl
        //options.selectedBackgroundColor = UIColor(red: 1, green: 112/255.0, blue: 92/255.0, alpha: 1.0)
        //options.selectedTextColor = UIColor.orangeColor()
        options.menuItemMode = .Underline(height: 3, color: COLOR, horizontalPadding: 0, verticalPadding: 0)
        let pagingMenuController = PagingMenuController(viewControllers: viewControllers, options: options)
        pagingMenuController.view.frame.origin.y += 0
        pagingMenuController.view.frame.size.height -= 0
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMoveToParentViewController(self)
        
        
        self.listViewGo()
        // Do any additional setup after loading the view.
    }
    
    
    //小视图中的内容和方法
    func listViewGo() {
        
        listView.backgroundColor = RGREY
        listView.layer.cornerRadius = 10
        listView.clipsToBounds = true
        listView.alpha = 0.8
        listView.frame = CGRectMake(WIDTH-150, -200, 120, 160)
        for i in 0...3 {
            let listChilds = UIButton()
            let titImage = UIImageView()
            
            titImage.frame = CGRectMake(15, CGFloat(i)*40+13, 14, 14)
            titImage.image = UIImage(named: imageArr[i])
            listView.addSubview(titImage)
            
            listChilds.frame = CGRectMake(20, CGFloat(i)*40, 100, 40)
            //             listChilds.backgroundColor = UIColor.orangeColor()
            listChilds.setTitle(nameArr[i], forState: .Normal)
            listChilds.setTitleColor(UIColor.blackColor(), forState: .Normal)
            listChilds.addTarget(self, action: #selector(ConcernViewController.listClick(_:)), forControlEvents: .TouchUpInside)
            listView.addSubview(listChilds)
            listChilds.tag = i
            print(i)
        }
        
        self.navigationController?.view.addSubview(listView)
        
    }
    
    func listClick(btn:UIButton) {
        print(btn.tag)
        switch btn.tag {
        case 0:
            let meizhuang = SanFangViewController()
            self.navigationController?.pushViewController(meizhuang, animated: true)
            meizhuang.title = "美妆"
            meizhuang.nameArr = ["美妆","美发","设计","造型"]
            listView.frame = CGRectMake(WIDTH-150, -200, 120, 160)
            
        case 1:
            let meijia = MeijiaViewController()
            self.navigationController?.pushViewController(meijia, animated: true)
            meijia.title = "美甲"
            listView.frame = CGRectMake(WIDTH-150, -200, 120, 160)
            
        case 2:
            let sheying = SanFangViewController()
            self.navigationController?.pushViewController(sheying, animated: true)
            sheying.title = "摄影"
            sheying.nameArr = ["摄影","演出","车展","赛事"]
            listView.frame = CGRectMake(WIDTH-150, -200, 120, 160)
            
        default:
            let gengduo = GengduoViewController()
            self.navigationController?.pushViewController(gengduo, animated: true)
            gengduo.title = "更多"
            
            gengduo.nameArr = ["健身","舞蹈","教育","陪游","陪吃","陪玩"]
            listView.frame = CGRectMake(WIDTH-150, -200, 120, 160)
            
        }
        
    }
    

    @IBAction func tableMassage(sender: AnyObject) {
        
        print("列表")
        if hidden == false {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.5)
            listView.frame = CGRectMake(WIDTH-150, 74, 120, 160)
            UIView.commitAnimations()
            hidden = true
        }else{
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.5)
            listView.frame = CGRectMake(WIDTH-150, -200, 120, 160)
            UIView.commitAnimations()
            hidden = false
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
