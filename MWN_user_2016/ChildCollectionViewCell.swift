//
//  ChildCollectionViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ChildCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView?
    let nameBtn = UIButton()
    var name: UILabel?
    var number = UILabel()
    var contact = UILabel()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: CGRectGetWidth(self.frame), height: (CGRectGetWidth(self.frame))/11*7))
        imageView?.backgroundColor = rand_color()
        
        if let imageView = imageView {
            self.addSubview(imageView)
            
            name = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(imageView.frame)+5, width: CGRectGetWidth(self.frame) - 100, height: 20))
            //name?.backgroundColor = UIColor.orangeColor()
            name?.font = UIFont.systemFontOfSize(14)
            nameBtn.frame = CGRect(x: 0, y: CGRectGetMaxY(imageView.frame)+5, width: CGRectGetWidth(self.frame) - 100, height: 20)
            
            number = UILabel(frame: CGRect(x: CGRectGetWidth(self.frame) - 80, y: CGRectGetMaxY(imageView.frame)+5, width: 80, height: 20))
            //number.backgroundColor = UIColor.greenColor()
            number.textAlignment = .Right
            number.font = UIFont.systemFontOfSize(13)
            number.textColor = UIColor(red: 202/255.0, green: 202/255.0, blue: 202/255.0, alpha: 1.0)
            
            contact = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(imageView.frame) + 30, width: CGRectGetWidth(self.frame) - 20, height: 20))
            //contact.backgroundColor = UIColor.brownColor()
            contact.font = UIFont.systemFontOfSize(13)
            contact.textColor = GREY
            
            if let text = name {
                self.addSubview(text)
            }
            self.addSubview(nameBtn)
            self.addSubview(number)
            self.addSubview(contact)
        }
    }
    
    func rand_color() -> UIColor {
        let color:  CGFloat = CGFloat(random()) / CGFloat(RAND_MAX);
        let color1: CGFloat = CGFloat(random()) / CGFloat(RAND_MAX);
        let color2: CGFloat = CGFloat(random()) / CGFloat(RAND_MAX);
        //let color3: CGFloat = CGFloat(random()) / CGFloat(RAND_MAX);
        // txta.text = "result: \(color) \(color1) \(color2)";
        return UIColor(red: color, green: color1, blue: color2, alpha: 1);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
