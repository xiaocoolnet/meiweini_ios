//
//  BuyListTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BuyListTableViewCell: UITableViewCell {

    var busName = UILabel()
    var busImage = UIImageView()
    var busCommon = UILabel()
    var dateLab = UILabel()
    var busNum = UILabel()
    var staly = UILabel()
    var price = UILabel()
    var cancel = UIButton()
    var pay = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        busName.frame = CGRectMake(10, 10, 120, 20)
        busName.font = UIFont.systemFontOfSize(15)
        staly.frame = CGRectMake(WIDTH-70, 10, 60, 20)
        staly.font = UIFont.systemFontOfSize(13)
        staly.textColor = UIColor(red: 1, green: 95/255.0, blue: 73/255.0, alpha: 1.0)
        staly.textAlignment = .Right
        busImage.frame = CGRectMake(10, 40, 60, 60)
        busCommon.frame = CGRectMake(80, 40, WIDTH-140, 40)
        busCommon.font = UIFont.systemFontOfSize(14)
        busCommon.numberOfLines = 0
        dateLab.frame = CGRectMake(80, 85, 150, 15)
        dateLab.font = UIFont.systemFontOfSize(13)
        dateLab.textColor = GREY
        price.frame = CGRectMake(WIDTH-60, 40, 50, 20)
        price.font = UIFont.systemFontOfSize(13)
        price.textAlignment = .Right
        busNum.frame = CGRectMake(WIDTH/3*2, 85, 80, 15)
        busNum.textColor = GREY
        busNum.textAlignment = .Right
        busNum.font = UIFont.systemFontOfSize(13)
        cancel.frame = CGRectMake(10, 110, 55, 20)
        cancel.setTitle("取消订单", forState: .Normal)
        cancel.titleLabel!.font = UIFont.systemFontOfSize(13)
        cancel.setTitleColor(UIColor(red: 1, green: 95/255.0, blue: 73/255.0, alpha: 1.0), forState: .Normal)
        pay.frame = CGRectMake(WIDTH-50, 110, 40, 20)
        pay.setTitle("去付款", forState: .Normal)
        pay.titleLabel!.font = UIFont.systemFontOfSize(13)
        pay.setTitleColor(UIColor(red: 1, green: 95/255.0, blue: 73/255.0, alpha: 1.0), forState: .Normal)
        
        self.addSubview(busName)
        self.addSubview(staly)
        self.addSubview(busImage)
        self.addSubview(busNum)
        self.addSubview(busCommon)
        self.addSubview(price)
        self.addSubview(dateLab)
        self.addSubview(cancel)
        self.addSubview(pay)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
