//
//  ModelTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ModelTableViewCell: UITableViewCell {

    var titleImage = UIImageView()
    var nameLab = UILabel()
    var contactLab = UILabel()
    var locationLab = UILabel()
    let shareBtn = UIButton()
    var zanBtn = UIButton()
    var massageBtn = UIButton()
    var presentBtn = UIButton()
    
    
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
        locationLab.frame = CGRectMake(155, 125, 60, 20)
        locationLab.font = UIFont.systemFontOfSize(13)
        locationLab.textColor = GREY
        shareBtn.frame = CGRectMake(WIDTH-30, 5, 25, 25)
        shareBtn.setImage(UIImage(named: "ic_fengxiang-hui.png"), forState: .Normal)
        
        zanBtn.frame = CGRectMake(WIDTH-123, 120, 28, 25)
        zanBtn.setImage(UIImage(named: "ic_shoucang-0.png"), forState: .Normal)
        
        massageBtn.frame = CGRectMake(WIDTH-95, 120, 30, 25)
        massageBtn.setImage(UIImage(named: "ic_liangtian-fen.png"), forState: .Normal)
        
        presentBtn.frame = CGRectMake(WIDTH-55, 120, 50, 25)
        presentBtn.backgroundColor = UIColor.orangeColor()
        
        self.addSubview(titleImage)
        self.addSubview(nameLab)
        self.addSubview(contactLab)
        self.addSubview(locationLab)
        self.addSubview(shareBtn)
        self.addSubview(zanBtn)
        self.addSubview(massageBtn)
        self.addSubview(presentBtn)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
