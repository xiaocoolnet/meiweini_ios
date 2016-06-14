//
//  MeijiaViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import PagingMenuController

class MeijiaViewController: UIViewController {

    let meijia = ChildrenViewController()
    let meijie = ChildrenViewController()
    let pifuhuli = ChildrenViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.hidden = true
        
        self.view.backgroundColor = RGREY
        
        meijia.title = "美甲"
        meijie.title = "美睫"
        pifuhuli.title = "皮肤护理"
        let viewControllers = [meijia,meijie,pifuhuli]
        let options = PagingMenuOptions()
        options.menuItemMargin = 5
        options.menuHeight = 40
        options.menuDisplayMode = .SegmentedControl
        //options.selectedBackgroundColor = UIColor(red: 1, green: 112/255.0, blue: 92/255.0, alpha: 1.0)
        //options.selectedTextColor = UIColor.blackColor()
        options.menuItemMode = .Underline(height: 3, color: COLOR, horizontalPadding: 0, verticalPadding: 0)
        let pagingMenuController = PagingMenuController(viewControllers: viewControllers, options: options)
        pagingMenuController.view.frame.origin.y += 0
        pagingMenuController.view.frame.size.height -= 0
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMoveToParentViewController(self)
        
        
        // Do any additional setup after loading the view.
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
