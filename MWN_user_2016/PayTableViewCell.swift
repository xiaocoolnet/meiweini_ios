//
//  PayTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PayTableViewCell: UITableViewCell {

    var payImage = UIImageView()
    var payStyle = UILabel()
    var paySmore = UILabel()
    var selector = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        payImage.frame = CGRectMake(10, 30, 33, 26)
        payStyle.frame = CGRectMake(60, 20, 250, 20)
        payStyle.font = UIFont.systemFontOfSize(16)
        paySmore.frame = CGRectMake(70, 45, 150, 15)
        paySmore.font = UIFont.systemFontOfSize(12)
        paySmore.textColor = UIColor(red: 165/255.0, green: 165/255.0, blue: 165/255.0, alpha: 1.0)
        selector.frame = CGRectMake(WIDTH-50, 17.5, 45, 45)
        selector.setImage(UIImage(named: "ic_xuanzhong.png"), forState: .Normal)
        
        self.addSubview(paySmore)
        self.addSubview(payStyle)
        self.addSubview(payImage)
        self.addSubview(selector)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
