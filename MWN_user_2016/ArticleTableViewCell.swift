//
//  ArticleTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    let titImage = UIImageView()
    let titName = UILabel()
    let contant = UILabel()
    let timeLab = UILabel()
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        titImage.frame = CGRectMake(10, 10, 80, 80)
        titName.frame = CGRectMake(100, 8, 200, 24)
        titName.font = UIFont.systemFontOfSize(16)
        contant.frame = CGRectMake(100, 33, WIDTH-110, 57)
        contant.numberOfLines = 0
        contant.alpha = 0.8
        contant.textAlignment = .Justified
        contant.font = UIFont.systemFontOfSize(14)
        timeLab.frame = CGRectMake(WIDTH-110, 15, 100, 18)
        timeLab.font = UIFont.systemFontOfSize(11)
        timeLab.textColor = UIColor.grayColor()
        timeLab.textAlignment = .Right
        
        self.addSubview(titImage)
        self.addSubview(titName)
        self.addSubview(contant)
        self.addSubview(timeLab)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
