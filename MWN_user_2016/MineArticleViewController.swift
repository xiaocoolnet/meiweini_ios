//
//  MineArticleViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/8.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineArticleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var myTableView = UITableView()
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = RGREY
        
        myTableView.frame = CGRectMake(0, 44, WIDTH, HEIGHT-104)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerClass(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(myTableView)
        myTableView.rowHeight = 100
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!ArticleTableViewCell
        cell.selectionStyle = .None
        cell.titImage.image = UIImage(named: "kb2.png")
        cell.titName.text = "银魂"
        cell.contant.text = "别说什么快逃了，别再一个人背负所有的事情，这太见外了。流着眼泪乞求帮助，痛哭流涕的来依靠我。想哭的时候就哭出来吧，想笑的时候就笑出来。当你哭到变丑的时候，我会比你哭的更丑，当你捧腹大笑时，我会比你笑得更大声。只要这样就好了。比起舍弃自我高洁地死去，还不如找自己的想法活下去，就算肮脏点也没关系。"
        cell.timeLab.text = "2016-5-23 13:00"
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let next = ArticleViewController()
        self.navigationController?.pushViewController(next, animated: true)
        
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
