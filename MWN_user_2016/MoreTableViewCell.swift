//
//  MoreTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    let morePay = UILabel()
    let more = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        morePay.frame = CGRectMake(WIDTH/2-55, 20, 100, 20)
        morePay.font = UIFont.systemFontOfSize(14)
        morePay.textColor = UIColor(red: 165/255.0, green: 165/255.0, blue: 165/255.0, alpha: 1.0)
        more.frame = CGRectMake(WIDTH/2+45, 25, 11, 11)
        more.image = UIImage(named: "ic_jiangtou-down.png")
        
        self.addSubview(more)
        self.addSubview(morePay)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
