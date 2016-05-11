//
//  MineBusinessTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/11.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineBusinessTableViewCell: UITableViewCell {

    let line = UILabel()
    let titImage = UIImageView()
    let titLab = UILabel()
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
        line.frame = CGRectMake(80, 10, 1, 60)
        line.backgroundColor = RGREY
        self.addSubview(line)
        
        titImage.frame = CGRectMake(20, 20, 40, 40)
        titLab.frame = CGRectMake(90, 10, WIDTH-102, 40)
        titLab.font = UIFont.systemFontOfSize(16)
        titLab.numberOfLines = 0
        timeLab.frame = CGRectMake(WIDTH-150, 53, 138, 17)
        timeLab.font = UIFont.systemFontOfSize(13)
        timeLab.alpha = 0.8
        timeLab.textAlignment = .Right
        
        self.addSubview(titImage)
        self.addSubview(titLab)
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
