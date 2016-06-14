//
//  ChildsTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ChildsTableViewCell: UITableViewCell {

    var titleName = UILabel()
    var contact = UILabel()
    var titImage = UIImageView()
    var sold = UILabel()
    var price = UILabel()
    var priceOld = UILabel()
    let redLine = UILabel()
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        
        titImage.frame = CGRectMake(WIDTH*10/375, WIDTH*5/375, WIDTH*110/375, WIDTH*110/375)
        titImage.backgroundColor = rand_color()
        
        
        titleName.frame = CGRectMake(WIDTH*125/375, WIDTH*5/375, 100, 20)
        titleName.font = UIFont.systemFontOfSize(15)
        contact.frame = CGRectMake(WIDTH*125/375, WIDTH*5/375+20, WIDTH*255/375-65, WIDTH*110/375-40)
        contact.font = UIFont.systemFontOfSize(14)
        contact.textColor = UIColor(red: 62/255.0, green: 63/255.0, blue: 65/255.0, alpha: 1.0)
        contact.numberOfLines = 0
        sold.frame = CGRectMake(WIDTH*125/375, WIDTH*115/375-20, 100, 20)
        sold.font = UIFont.systemFontOfSize(12)
        sold.textColor = GREY
        price.frame = CGRectMake(WIDTH-65, WIDTH*5/375, 60, 25)
        price.textAlignment = .Center
        price.textColor = COLOR
        price.font = UIFont.systemFontOfSize(16)
        priceOld.frame = CGRectMake(WIDTH-60, WIDTH*5/375+25, 50, 20)
        priceOld.textAlignment = .Center
        priceOld.textColor = GREY
        priceOld.font = UIFont.systemFontOfSize(12)
        redLine.frame = CGRectMake(WIDTH-60, WIDTH*5/375+35, 50, 0.5)
        redLine.backgroundColor = COLOR
        
        self.addSubview(titImage)
        self.addSubview(titleName)
        self.addSubview(contact)
        self.addSubview(sold)
        self.addSubview(priceOld)
        self.addSubview(price)
        self.addSubview(redLine)
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
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
