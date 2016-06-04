//
//  MineOneTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class MineOneTableViewCell: UITableViewCell {

    var titImage = UIImageView()
    var titLab = UILabel()
    let jiantou = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        
        titImage.frame = CGRectMake(10, 20, 20, 20)
        titLab.frame = CGRectMake(40, 20, 100, 20)
        jiantou.frame = CGRectMake(WIDTH-20, 23, 8, 14)
        jiantou.image = UIImage(named: "ic_arrow_right.png")
        let line = UILabel(frame: CGRectMake(10, 59.5, WIDTH-10, 0.5))
        line.backgroundColor = GREY
        
        self.addSubview(line)
        self.addSubview(titImage)
        self.addSubview(titLab)
        self.addSubview(jiantou)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
