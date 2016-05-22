//
//  PhotoalbumTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PhotoalbumTableViewCell: UITableViewCell {

    var photoName = UILabel()
    var comment = UILabel()
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
        photoName.frame = CGRectMake(10, 10, 100, 20)
        photoName.font = UIFont.systemFontOfSize(16)
        price.frame = CGRectMake(WIDTH-110, 10, 100, 25)
        price.font = UIFont.systemFontOfSize(19)
        price.textColor = UIColor(red: 247/255.0, green: 80/255.0, blue: 1/255.0, alpha: 1.0)
        price.textAlignment = .Right
        comment.frame = CGRectMake(10, 35, WIDTH-35, 45)
        comment.textColor = UIColor(red: 129/255.0, green: 129/255.0, blue: 129/255.0, alpha: 1.0)
        comment.font = UIFont.systemFontOfSize(14)
        comment.numberOfLines = 0
        
        self.addSubview(photoName)
        self.addSubview(price)
        self.addSubview(comment)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
