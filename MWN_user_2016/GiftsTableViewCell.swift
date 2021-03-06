//
//  GiftsTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class GiftsTableViewCell: UITableViewCell {

    let line = UILabel()
    let titImage = UIImageView()
    let titName = UILabel()
    let titLab = UILabel()
    let timeLab = UILabel()
    let gifts = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        line.frame = CGRectMake(120, 10, 1, 100)
        line.backgroundColor = RGREY
        self.addSubview(line)
        
        titImage.frame = CGRectMake(30, 23, 60, 60)
        titImage.image = UIImage(named: "ic_liwu-1.png")
        titName.frame = CGRectMake(25, 83, 70, 20)
        titName.font = UIFont.systemFontOfSize(13)
        titName.textAlignment = .Center
        titName.alpha = 0.8
        titLab.frame = CGRectMake(133, 10, WIDTH/2, 25)
        titLab.font = UIFont.systemFontOfSize(16)
        timeLab.frame = CGRectMake(133, 40, WIDTH/2+50, 20)
        timeLab.font = UIFont.systemFontOfSize(14)
        timeLab.alpha = 0.8
        gifts.frame = CGRectMake(WIDTH-100, 93, 90, 17)
        gifts.setTitle("", forState: .Highlighted)
        gifts.titleLabel?.font = UIFont.systemFontOfSize(14)
//        gifts.titleLabel?.textAlignment = .Right
        gifts.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
        self.addSubview(titImage)
        self.addSubview(titName)
        self.addSubview(titLab)
        self.addSubview(timeLab)
        self.addSubview(gifts)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
