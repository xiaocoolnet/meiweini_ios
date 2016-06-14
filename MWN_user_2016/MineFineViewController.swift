//
//  MineFineViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineFineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var myTableView = UITableView()
    var word:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = RGREY
        
        myTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64)
        myTableView.backgroundColor = UIColor.clearColor()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(FineTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.rowHeight = 70
        self.view.addSubview(myTableView)
        
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 26
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let title = UILabel(frame: CGRectMake(15, 0, 30, 30))
        title.font = UIFont.systemFontOfSize(14)
        title.textColor = UIColor.grayColor()
        title.text = word[section]
        view.addSubview(title)
        
        return view
        
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        let i = "#"
        word.insert(i, atIndex: 26)
        return word
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!FineTableViewCell
        cell.selectionStyle = .None
        cell.userImage.image = UIImage(named: "kb4.png")
        cell.userName.text = "不要在命运需要你逆风飞翔时选择随风而去"
        cell.userName.numberOfLines = 0
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        
        
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
