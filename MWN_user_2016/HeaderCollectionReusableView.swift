//
//  HeaderCollectionReusableView.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    var titImage = UIImageView()
    let arrow = UIImageView()
    let more = UIButton()
    var kindName = UILabel()
    //var more = UILabel()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        
        titImage.frame = CGRectMake(15, self.bounds.size.height-30, 16, 16)
        self.addSubview(titImage)
        
        kindName.frame = CGRectMake(40, self.bounds.size.height-37, 100, 30)
        
        kindName.font = UIFont.systemFontOfSize(18)
        kindName.textColor = COLOR
        
        self.addSubview(kindName)
        
        more.frame = CGRectMake(self.bounds.size.width-50, self.bounds.size.height-34, 30, 24)
        more.setTitle("更多", forState: .Normal)
        more.titleLabel?.font = UIFont.systemFontOfSize(13)
        more.setTitleColor(GREY, forState: .Normal)
        self.addSubview(more)
        
        arrow.frame = CGRectMake(self.bounds.size.width-20, self.bounds.size.height-29 , 8, 14)
        arrow.image = UIImage(named: "ic_arrow_right.png")
        self.addSubview(arrow)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
