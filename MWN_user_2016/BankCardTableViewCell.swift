//
//  BankCardTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class BankCardTableViewCell: UITableViewCell {

    let backView = UIView()
    let backImage = UIImageView()
    
    let titImage = UIImageView()
    let titLab = UILabel()
    let cardStyle = UILabel()
    let cardNum = UILabel()
    let details = UIButton()
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        backView.frame = CGRectMake(15, 20, WIDTH-30, 130)
        backView.layer.cornerRadius = 10
        self.addSubview(backView)
        backImage.frame = backView.bounds
        backView.addSubview(backImage)
        let back = UILabel(frame: CGRectMake(20, 20, 40, 40))
        back.backgroundColor = UIColor.whiteColor()
        back.layer.cornerRadius = 20
        back.clipsToBounds = true
        backView.addSubview(back)
        
        titImage.frame = CGRectMake(25, 25, 30, 30)
        titLab.frame = CGRectMake(75, 20, 150, 20)
        titLab.text = "中国工商银行"
        titLab.textColor = UIColor.whiteColor()
        cardStyle.frame = CGRectMake(75, 43, 100, 17)
        cardStyle.textColor = UIColor.whiteColor()
        cardStyle.text = "储蓄卡"
        cardNum.frame = CGRectMake(0, 80, WIDTH-30, 30)
        cardNum.textColor = UIColor.whiteColor()
        cardNum.textAlignment = .Center
        cardNum.font = UIFont.boldSystemFontOfSize(20)
        cardNum.text = "**** **** **** 2843"
        details.frame = CGRectMake(WIDTH-90, 55, 55, 25)
        details.layer.cornerRadius = 5
        details.titleLabel?.font = UIFont.systemFontOfSize(12)
        details.setTitle("解绑", forState: .Normal)
        details.setTitle("", forState: .Highlighted)
        details.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        details.backgroundColor = UIColor(red: 244/255.0, green: 81/255.0, blue: 31/255.0, alpha: 1.0)
        
        backView.addSubview(titImage)
        backView.addSubview(titLab)
        backView.addSubview(cardStyle)
        backView.addSubview(cardNum)
        backView.addSubview(details)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
