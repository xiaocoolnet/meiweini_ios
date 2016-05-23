//
//  PhotoTableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell,UIScrollViewDelegate {

    var backView = UIView()
    var zanBtn = UIButton()
    var photoNum = UILabel()
    let scrollView = UIScrollView()
    var picArr = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        scrollView.frame = CGRectMake(0, 0,WIDTH, WIDTH)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        
        picArr = ["2615426_113512492130_2.jpg","13856273252339753.jpg","6619487709235159644.jpg","OMyMrYbr.jpg","yangguangxiadelvye_5189084.jpg","yizhilvshuzhi_5197526.jpg"]
        for i in 0...5 {
            let  imageView = UIImageView()
            imageView.frame = CGRectMake(CGFloat(i)*WIDTH, 0, WIDTH, WIDTH)
            imageView.image = UIImage(named: picArr[i] as! String)
            imageView.tag = i+1
            //为图片视图添加点击事件
            imageView.userInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(_:)))
            //            手指头
            tap.numberOfTapsRequired = 1
            //            单击
            tap.numberOfTouchesRequired = 1
            imageView.addGestureRecognizer(tap)
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSizeMake(6*WIDTH, 0)
        scrollView.contentOffset = CGPointMake(0, 0)
        self.addSubview(scrollView)

        backView.frame = CGRectMake(0, WIDTH-40, WIDTH, 40)
        backView.backgroundColor = UIColor.whiteColor()
        backView.alpha = 0.3
        zanBtn.frame = CGRectMake(10, WIDTH-35, 40, 33)
        zanBtn.setImage(UIImage(named: "ic_shoucang-0.png"), forState: .Normal)
        photoNum.frame = CGRectMake(WIDTH-50, WIDTH-30, 40, 20)
        photoNum.textAlignment = .Right
        photoNum.text = "1/6"
        photoNum.textColor = UIColor.blackColor()
        
        self.addSubview(backView)
        self.addSubview(zanBtn)
        self.addSubview(photoNum)
        
        
    }
    //    图片点击事件
    func tapAction(tap:UIGestureRecognizer) {
        var imageView = UIImageView()
        imageView = tap.view as! UIImageView
        print("这是第\(Int(imageView.tag))张图片")
//        var browser:PhotoBrowserView
//        //网路数据源
//        browser = PhotoBrowserView.initWithPhotos(withUrlArray: self.picArr as [AnyObject])
//        //类型为网络
//        browser.sourceType = SourceType.REMOTE
//        //设置展示哪张图片
//        browser.index = imageView.tag
//        //显示
//        browser.show()
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("222\(Int(scrollView.frame.size.width/WIDTH))")
        photoNum.text = "\(Int(scrollView.contentOffset.x/WIDTH)+1)/6"
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
