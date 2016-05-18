//
//  MassageKindViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MassageKindViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var massageTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = RGREY
        
        massageTable.frame = CGRectMake(0, 0, WIDTH, HEIGHT)
        massageTable.backgroundColor = RGREY
        massageTable.delegate = self
        massageTable.dataSource = self
        massageTable.registerClass(MassageListTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(massageTable)
        massageTable.rowHeight = 65
//        massageTable.scrollEnabled = false
        let one = UIView(frame: CGRectMake(0, 0, WIDTH, 10))
        massageTable.tableHeaderView = one
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!MassageListTableViewCell
        cell.selectionStyle = .None
        cell.massageImage.image = UIImage(named: "kb4.png")
        cell.userName.text = "南柯一梦"
        cell.common.text = "今日的世界，物质文明发达，在表面上来看，是历史上最幸福的时代；但是人们为了生存的竞争而忙碌，为了战争的毁灭而惶恐，为了欲海的难填而烦恼。在精神上，也可以说是历史上最痛苦的时代。人是莫名其妙的生下来，无可奈何的活着，最后是不知所以然的死掉。"
        cell.timeLab.text = "16-4-28"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("消息\(indexPath.row)")
        let massageList = MassageListViewController()
        self.navigationController?.pushViewController(massageList, animated: true)
        
        
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
