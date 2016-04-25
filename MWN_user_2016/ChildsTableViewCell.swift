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
        
        titImage.frame = CGRectMake(10, 5, 110, 110)
        titImage.backgroundColor = rand_color()
        
        
        titleName.frame = CGRectMake(125, 5, 100, 25)
        contact.frame = CGRectMake(125, 30, WIDTH/2, 60)
        contact.font = UIFont.systemFontOfSize(15)
        contact.textColor = UIColor(red: 62/255.0, green: 63/255.0, blue: 65/255.0, alpha: 1.0)
        contact.numberOfLines = 0
        sold.frame = CGRectMake(125, 95, 100, 20)
        sold.font = UIFont.systemFontOfSize(13)
        sold.textColor = GREY
        price.frame = CGRectMake(WIDTH-70, 5, 60, 30)
        price.textAlignment = .Left
        price.textColor = COLOR
        price.font = UIFont.systemFontOfSize(18)
        priceOld.frame = CGRectMake(WIDTH-60, 35, 45, 20)
        priceOld.textAlignment = .Left
        priceOld.textColor = GREY
        priceOld.font = UIFont.systemFontOfSize(13)
        redLine.frame = CGRectMake(WIDTH-60, 45, 45, 0.5)
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
