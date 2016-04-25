//
//  RANCollectionViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class RANCollectionViewCell: UICollectionViewCell {
    var imageView : UIImageView?
    //    var priceLabel : UILabel?
    var shops : RANModel? {
        didSet{
            
//            imageView?.image = UIImage(named: "kb3.png")
            imageView?.sd_setImageWithURL(NSURL(string: shops!.img as! String),placeholderImage: UIImage(named: "kb3.png"))
            
            print("加载完成")
//             priceLabel?.text = shops?.price as? String
            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        self.contentView.addSubview(imageView!)
        
        //        priceLabel = UILabel()
        //        priceLabel?.textAlignment = NSTextAlignment.Center
 //        priceLabel?.backgroundColor = UIColor.greenColor()
        //        self.contentView.addSubview(priceLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRectMake(10, 0, self.bounds.size.width, self.bounds.size.height )
        //        priceLabel?.frame = CGRectMake(0, self.bounds.size.height - 30, self.bounds.size.width, 30)
    }

}
