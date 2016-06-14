//
//  MassageListTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MassageListTableViewCell: UITableViewCell {

    var massageImage = UIImageView()
    var userName = UILabel()
    var common = UILabel()
    var timeLab = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        massageImage.frame = CGRectMake(10, 10, 45, 45)
        massageImage.layer.cornerRadius = 22.5
        massageImage.clipsToBounds = true
        userName.frame = CGRectMake(65, 10, WIDTH/2, 20)
        common.frame = CGRectMake(65, 35, WIDTH-120, 20)
        common.textColor = UIColor(red: 104/255.0, green: 104/255.0, blue: 104/255.0, alpha: 1.0)
        common.font = UIFont.systemFontOfSize(15)
        timeLab.frame = CGRectMake(WIDTH-110, 25, 100, 20)
        timeLab.textColor = UIColor(red: 104/255.0, green: 104/255.0, blue: 104/255.0, alpha: 1.0)
        timeLab.font = UIFont.systemFontOfSize(13)
        timeLab.textAlignment = .Right
        
        self.addSubview(massageImage)
        self.addSubview(common)
        self.addSubview(timeLab)
        self.addSubview(userName)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
