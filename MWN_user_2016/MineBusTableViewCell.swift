//
//  MineBusTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineBusTableViewCell: UITableViewCell {

    var busName = UILabel()
    var busImage = UIImageView()
    var busCommon = UILabel()
    var dateLab = UILabel()
    var busNum = UILabel()
    var edit = UIButton()
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
        busName.frame = CGRectMake(10, 10, 120, 20)
        busName.font = UIFont.systemFontOfSize(15)
        edit.frame = CGRectMake(WIDTH-50, 10, 40, 20)
        edit.setTitle("编辑", forState: .Normal)
        edit.setTitle("", forState: .Highlighted)
        edit.titleLabel?.font = UIFont.systemFontOfSize(13)
        edit.setTitleColor(UIColor(red: 1, green: 95/255.0, blue: 73/255.0, alpha: 1.0), forState: .Normal)
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
        
        self.addSubview(busName)
        self.addSubview(edit)
        self.addSubview(busImage)
        self.addSubview(busNum)
        self.addSubview(busCommon)
        self.addSubview(price)
        self.addSubview(dateLab)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
