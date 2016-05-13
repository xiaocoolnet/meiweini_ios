//
//  ShopsViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/12.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit
import PagingMenuController

class ShopsViewController: UIViewController {

    let backImage = UIImageView()
    let busImage = UIImageView()
    let titName = UILabel()
    let fineNum = UILabel()
    let fine = UILabel()
    
    let oneView = CommodityViewController()
    let twoView = CommodityViewController()
    
    var nameArr:[String] = ["新品上架","全部商品"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "商家"
        self.view.backgroundColor = RGREY
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "ic_xiaoxi-1.png"), style: .Done, target: self, action: #selector(ShopsViewController.messageList))
        self.navigationItem.rightBarButtonItem = rightItem
        
        backImage.frame = CGRectMake(0, 0, WIDTH, WIDTH/4)
        backImage.image = UIImage(named: "08D62E1FA8F34DACE01FA4FFAEA2CBA3.png")
        self.view.addSubview(backImage)
        busImage.frame = CGRectMake(0, WIDTH/8, WIDTH/8, WIDTH/8)
        busImage.image = UIImage(named: "店铺图片.png")
        self.view.addSubview(busImage)
        titName.frame = CGRectMake(WIDTH/8+10, WIDTH/8, WIDTH/2, WIDTH/16)
        titName.textColor = UIColor.whiteColor()
        titName.text = "清风路过的夏天"
        self.view.addSubview(titName)
        fineNum.frame = CGRectMake(WIDTH-55, WIDTH/8+10, 45, WIDTH/20)
        fineNum.font = UIFont.systemFontOfSize(13)
        fineNum.textColor = UIColor.whiteColor()
        fineNum.textAlignment = .Center
        fineNum.text = "13999"
        self.view.addSubview(fineNum)
        fine.frame = CGRectMake(WIDTH-55, WIDTH/8+7+WIDTH/20, 45, WIDTH/20)
        fine.font = UIFont.systemFontOfSize(11)
        fine.textColor = UIColor.whiteColor()
        fine.textAlignment = .Center
        fine.text = "粉丝数"
        self.view.addSubview(fine)
        
        oneView.title = nameArr[0]
        twoView.title = nameArr[1]
        
        let viewControllers = [oneView,twoView]
        let options = PagingMenuOptions()
        options.menuItemMargin = 5
        options.menuHeight = 40
        
        options.menuDisplayMode = .SegmentedControl
        //options.menuDisplayMode = .Infinite(widthMode: .Fixed(width: WIDTH/4))
        //options.selectedBackgroundColor = UIColor(red: 1, green: 112/255.0, blue: 92/255.0, alpha: 1.0)
        //options.selectedTextColor = UIColor.blackColor()
        options.menuItemMode = .Underline(height: 3, color: UIColor(red: 1, green: 95/255.0, blue: 73/255.0, alpha: 1.0), horizontalPadding: 0, verticalPadding: 0)
        let pagingMenuController = PagingMenuController(viewControllers: viewControllers, options: options)
        pagingMenuController.view.frame = CGRectMake(0, WIDTH/4, WIDTH, HEIGHT-WIDTH/4)
        pagingMenuController.view.frame.origin.y += 0
        pagingMenuController.view.frame.size.height -= 0
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMoveToParentViewController(self)

        // Do any additional setup after loading the view.
    }

    func messageList() {
        print("消息列表")
        let view = MineMassageViewController()
        self.navigationController?.pushViewController(view, animated: true)
        
        
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
