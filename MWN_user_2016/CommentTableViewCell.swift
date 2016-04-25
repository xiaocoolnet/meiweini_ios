//
//  CommentTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    var userImage = UIImageView()
    var userName = UILabel()
    var userComment = UILabel()
    var userDate = UILabel()
    var zanNum = UILabel()
    var comment = UILabel()
    var zanBtn = UIButton()
    var commentBtn = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        
        userImage.frame = CGRectMake(10, 10, 25, 25)
        userImage.layer.cornerRadius = 12.5
        userImage.clipsToBounds = true
        userName.frame = CGRectMake(45, 10, 100, 20)
        userName.font = UIFont.systemFontOfSize(14)
        userComment.frame = CGRectMake(45, 30, WIDTH/3*2, 50)
        userComment.font = UIFont.systemFontOfSize(14)
        userComment.numberOfLines = 0
        userDate.frame = CGRectMake(45, 80, 50, 15)
        userDate.font = UIFont.systemFontOfSize(12)
        userDate.textColor = GREY
        zanNum.frame = CGRectMake(WIDTH-100, 80, 30, 13)
        zanNum.font = UIFont.systemFontOfSize(12)
        zanNum.textColor = GREY
        zanNum.textAlignment = .Right
        zanBtn.frame = CGRectMake(WIDTH-70, 80, 15, 13)
        zanBtn.setImage(UIImage(named: "ic_xiaoxi-hui.png"), forState: .Normal)
        comment.frame = CGRectMake(WIDTH-55, 80, 30, 13)
        comment.font = UIFont.systemFontOfSize(12)
        comment.textColor = GREY
        comment.textAlignment = .Right
        commentBtn.frame = CGRectMake(WIDTH-25, 80, 15, 13)
        commentBtn.setImage(UIImage(named: "ic_shoucang-hui.png"), forState: .Normal)
        
        self.addSubview(userImage)
        self.addSubview(userName)
        self.addSubview(userComment)
        self.addSubview(userDate)
        self.addSubview(zanBtn)
        self.addSubview(zanNum)
        self.addSubview(comment)
        self.addSubview(commentBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
