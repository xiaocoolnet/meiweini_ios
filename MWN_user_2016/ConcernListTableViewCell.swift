//
//  ConcernListTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ConcernListTableViewCell: UITableViewCell {

    var busImage = UIImageView()
    var commom = UILabel()
    var dateLab = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        busImage.frame = CGRectMake(10, 15, 80, 80)
        busImage.layer.cornerRadius = 10
        busImage.clipsToBounds = true
        commom.frame = CGRectMake(100, 15, WIDTH/3*2, 60)
        commom.numberOfLines = 0
        dateLab.frame = CGRectMake(WIDTH-110, 80, 100, 15)
        dateLab.textColor = GREY
        dateLab.textAlignment = .Right
        dateLab.font = UIFont.systemFontOfSize(13)
        
        self.addSubview(busImage)
        self.addSubview(commom)
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
