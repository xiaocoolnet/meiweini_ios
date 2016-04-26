//
//  CommodityTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class CommodityTableViewCell: UITableViewCell {

    var commodity = UIImageView()
    var business = UILabel()
    var bus = UILabel()
    var RAM = UILabel()
    var price = UILabel()
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        business.frame = CGRectMake(10, 15, 150, 20)
        commodity.frame = CGRectMake(10, 45, WIDTH-20, (WIDTH-20)/5*3)
        bus.frame = CGRectMake(10, (WIDTH-20)/5*3+60, 100, 20)
        RAM.frame = CGRectMake(WIDTH-170, (WIDTH-20)/5*3+60, 80, 20)
        RAM.textColor = GREY
        RAM.font = UIFont.systemFontOfSize(12)
        RAM.textAlignment = .Center
        price.frame = CGRectMake(WIDTH-90, (WIDTH-20)/5*3+60, 80, 20)
        price.textAlignment = .Right
        
        self.addSubview(bus)
        self.addSubview(business)
        self.addSubview(commodity)
        self.addSubview(RAM)
        self.addSubview(price)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
