//
//  PayStyleTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PayStyleTableViewCell: UITableViewCell {

    let titImage = UIButton()
    let titName = UILabel()
    let contant = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        titImage.frame = CGRectMake(15, 20, 34, 31)
        titName.frame = CGRectMake(60, 10, WIDTH-100, 25)
        titName.font = UIFont.systemFontOfSize(16)
        contant.frame = CGRectMake(60, 40, WIDTH-100, 17.5)
        contant.textColor = UIColor.grayColor()
        contant.font = UIFont.systemFontOfSize(14)
        
        self.addSubview(titImage)
        self.addSubview(titName)
        self.addSubview(contant)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
