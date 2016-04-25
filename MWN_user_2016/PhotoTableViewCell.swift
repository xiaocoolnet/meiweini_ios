//
//  PhotoTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    var photoImage = UIImageView()
    var backView = UIView()
    var zanBtn = UIButton()
    var photoNum = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        
        photoImage.frame = CGRectMake(0, 0, WIDTH, WIDTH)
        backView.frame = CGRectMake(0, WIDTH-44, WIDTH, 44)
        backView.backgroundColor = UIColor.whiteColor()
        backView.alpha = 0.3
        zanBtn.frame = CGRectMake(10, 6, 36, 33)
        zanBtn.setImage(UIImage(named: "ic_shoucang-0.png"), forState: .Normal)
        photoNum.frame = CGRectMake(WIDTH-50, 12, 40, 20)
        photoNum.textAlignment = .Right
        photoNum.textColor = UIColor.blackColor()
        
        self.addSubview(photoImage)
        self.addSubview(backView)
        backView.addSubview(zanBtn)
        backView.addSubview(photoNum)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
