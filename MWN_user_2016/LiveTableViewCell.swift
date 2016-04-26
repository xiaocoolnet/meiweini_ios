//
//  LiveTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class LiveTableViewCell: UITableViewCell {

    var userImage = UIImageView()
    var anchorImage = UIImageView()
    var anchorName = UILabel()
    let locationImage = UIImageView()
    var location = UILabel()
    var number = UILabel()
    let lab = UILabel()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        self.backgroundColor = RGREY
        userImage.frame = CGRectMake(10, 15, 40, 40)
        userImage.layer.cornerRadius = 20
        userImage.clipsToBounds = true
        anchorName.frame = CGRectMake(65, 10, 150, 20)
        anchorName.font = UIFont.systemFontOfSize(13.5)
        location.frame = CGRectMake(80, 40, 100, 15)
        location.textColor = GREY
        location.font = UIFont.systemFontOfSize(11.5)
        locationImage.frame = CGRectMake(63, 38, 15, 15)
        locationImage.image = UIImage(named: "iconfont-dingwei.png")
        lab.frame = CGRectMake(WIDTH-40, 20, 30, 20)
        lab.textColor = GREY
        lab.text = "在看"
        lab.font = UIFont.systemFontOfSize(12)
        
        number.frame = CGRectMake(WIDTH-80, 20, 40, 20)
        number.textColor = UIColor(red: 252/255.0, green: 114/255.0, blue: 98/255.0, alpha: 1.0)
        number.textAlignment = .Right
        number.font = UIFont.systemFontOfSize(13)
        
        anchorImage.frame = CGRectMake(0, 65, WIDTH, 250)
        
        self.addSubview(userImage)
        self.addSubview(anchorImage)
        self.addSubview(anchorName)
        self.addSubview(location)
        self.addSubview(lab)
        self.addSubview(number)
        self.addSubview(locationImage)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
