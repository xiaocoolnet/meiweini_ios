//
//  AccountTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    let title = UILabel()
    var titPic = UIImageView()
    var money = UILabel()
    var recharge = UIButton()
    var withdraw = UIButton()
    let line = UILabel()
    let witLine = UILabel()
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        title.frame = CGRectMake(WIDTH/2-30, 15, 60, 30)
        title.textAlignment = .Center
        titPic.frame = CGRectMake(WIDTH/2-40, 55, 20, 20)
        money.frame = CGRectMake(WIDTH/2-20, 50, 60, 30)
        money.textAlignment = .Center
        line.frame = CGRectMake(0, 100, WIDTH, 1)
        line.backgroundColor = RGREY
        witLine.frame = CGRectMake(WIDTH/2, 105, 1, 34)
        witLine.backgroundColor = RGREY
        recharge.frame = CGRectMake(0, 100, WIDTH/2, 44)
        recharge.setTitleColor(UIColor.blackColor(), forState: .Normal)
        withdraw.frame = CGRectMake(WIDTH/2, 100, WIDTH/2, 44)
        withdraw.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        self.addSubview(title)
        self.addSubview(titPic)
        self.addSubview(money)
        self.addSubview(line)
        self.addSubview(witLine)
        self.addSubview(withdraw)
        self.addSubview(recharge)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
