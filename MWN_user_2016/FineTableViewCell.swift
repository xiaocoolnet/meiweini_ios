//
//  FineTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class FineTableViewCell: UITableViewCell {

    let userImage = UIImageView()
    let userName = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        userImage.frame = CGRectMake(10, 10, 50, 50)
        userImage.layer.cornerRadius = 25
        userImage.clipsToBounds = true
        userName.frame = CGRectMake(70, 10, WIDTH-100, 50)
        
        self.addSubview(userImage)
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
