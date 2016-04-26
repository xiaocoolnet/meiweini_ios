//
//  VideoTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    var anchorImage = UIImageView()
    var anchorName = UILabel()
    var zanBtn = UIButton()
    var zanNumber = UILabel()
    var downBtn = UIButton()
    var downNumber = UILabel()
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
          view.removeFromSuperview()
        }
        anchorImage.frame = CGRectMake(10, 10, WIDTH-20, 200)
        anchorName.frame = CGRectMake(10, 210, 150, 30)
        anchorName.font = UIFont.systemFontOfSize(13)
        anchorName.textColor = UIColor(red: 252/255.0, green: 114/255.0, blue: 98/255.0, alpha: 1.0)
        zanBtn.frame = CGRectMake(WIDTH-140, 212.5, 25, 25)
        zanBtn.setImage(UIImage(named: "ic_shoucang.png"), forState: .Normal)
        zanNumber.frame = CGRectMake(WIDTH-120, 210, 40, 30)
        zanNumber.textColor = UIColor(red: 252/255.0, green: 114/255.0, blue: 98/255.0, alpha: 1.0)
        zanNumber.font = UIFont.systemFontOfSize(13)
        downBtn.frame = CGRectMake(WIDTH-70, 212.5, 25, 25)
        downBtn.setImage(UIImage(named: "ic_xiazai.png"), forState: .Normal)
        downNumber.frame = CGRectMake(WIDTH-50, 210, 40, 30)
        downNumber.textColor = UIColor(red: 252/255.0, green: 114/255.0, blue: 98/255.0, alpha: 1.0)
        downNumber.font = UIFont.systemFontOfSize(13)
        
        self.addSubview(anchorImage)
        self.addSubview(anchorName)
        self.addSubview(zanBtn)
        self.addSubview(zanNumber)
        self.addSubview(downBtn)
        self.addSubview(downNumber)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
