//
//  PayStyleTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PayStyleTableViewCell: UITableViewCell {

    let titImage = UIImageView()
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
        titImage.frame = CGRectMake(10, 10, 40, 40)
        titName.frame = CGRectMake(60, 10, WIDTH-60, 20)
        titName.font = UIFont.systemFontOfSize(16)
        contant.frame = CGRectMake(60, 35, WIDTH-60, 15)
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
