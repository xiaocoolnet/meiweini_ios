//
//  ChildrenViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ChildrenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let reuseIdentifier = "cell"
    var array: [Int] = []
    
    var myTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = RGREY
        myTableView.frame = CGRectMake(0, 10, WIDTH, HEIGHT-124)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(ChildsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.view.addSubview(myTableView)
        
        myTableView.rowHeight = 120
        
        for i in 0...30 {
            array.append(i)
        }
        
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)as!ChildsTableViewCell
        cell.selectionStyle = .None
        cell.titImage.image = UIImage(named: "kb\(indexPath.row+1)")
        cell.titleName.text = "科比\(indexPath.row)"
        cell.contact.text = "无论多么艰难，都要继续向前，因为只有你放弃的那一刻，你才输了。"
        cell.sold.text = "已售31"
        cell.price.text = "¥29.00"
        cell.priceOld.text = "¥39.00"
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("商品\(indexPath.row)")
        let nextView = NextViewViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
        
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
