//
//  DiamondTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class DiamondTableViewCell: UITableViewCell {

    let title = UILabel()
    var titPic = UIImageView()
    var money = UILabel()
    var recharge = UIButton()
    let line = UILabel()
    
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
        recharge.frame = CGRectMake(0, 100, WIDTH, 44)
        recharge.setTitleColor(UIColor.blackColor(), forState: .Normal)
       
        self.addSubview(title)
        self.addSubview(titPic)
        self.addSubview(money)
        self.addSubview(line)
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
