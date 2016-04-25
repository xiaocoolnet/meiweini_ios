//
//  BusinessTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {

    var titleImage = UIImageView()
    var nameLab = UILabel()
    var contactLab = UILabel()
    var priceLab = UILabel()
    var muchLab = UILabel()
    
    var moreBtn = UIButton()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        titleImage.frame = CGRectMake(4, 2, 140, 146)
        titleImage.layer.cornerRadius = 5
        titleImage.clipsToBounds = true
        
        nameLab.frame = CGRectMake(155, 5, 100, 20)
        contactLab.frame = CGRectMake(155, 25, WIDTH/2, 80)
        contactLab.font = UIFont.systemFontOfSize(13)
        contactLab.textColor = GREY
        contactLab.numberOfLines = 0
        
        priceLab.frame = CGRectMake(155, 125, 60, 20)
        priceLab.textColor = COLOR
        
        muchLab.frame = CGRectMake(215, 130, 80, 15)
        muchLab.font = UIFont.systemFontOfSize(13)
        muchLab.textColor = GREY
        
        moreBtn.frame = CGRectMake(WIDTH-25, 125, 20, 20)
        moreBtn.setImage(UIImage(named: "更多.png"), forState: .Normal)
        
        self.addSubview(titleImage)
        self.addSubview(nameLab)
        self.addSubview(contactLab)
        self.addSubview(priceLab)
        self.addSubview(muchLab)
        self.addSubview(moreBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
