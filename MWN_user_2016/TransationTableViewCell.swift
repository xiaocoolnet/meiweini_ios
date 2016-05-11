//
//  TransationTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TransationTableViewCell: UITableViewCell {

    let titLab = UILabel()
    let timeLab = UILabel()
    let moneyLab = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        titLab.frame = CGRectMake(10, 10, WIDTH/3*2, 23)
        titLab.font = UIFont.systemFontOfSize(15)
        timeLab.frame = CGRectMake(10, 33, WIDTH/3*2, 17)
        timeLab.font = UIFont.systemFontOfSize(13)
        timeLab.textColor = UIColor.grayColor()
        moneyLab.frame = CGRectMake(WIDTH-100, 20, 90, 20)
        moneyLab.textAlignment = .Right
        moneyLab.font = UIFont.systemFontOfSize(13)
        
        self.addSubview(timeLab)
        self.addSubview(titLab)
        self.addSubview(moneyLab)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
