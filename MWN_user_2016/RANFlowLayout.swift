//
//  RANFlowLayout.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/24.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class RANFlowLayout: UICollectionViewFlowLayout {
    var colCount : Int?
    var shops : NSArray?
    lazy var attributes : NSArray = {
        return NSArray()
    }()
    
    //准备布局  当collectionView 的布局发生变化时，会被调用
    //通常是做布局准备工作，设置itemSize,滚动方向，内边距等
    override func prepareLayout() {
        super.prepareLayout()
        
        let tempArray = NSMutableArray()
        
        let cellHeight = NSMutableArray()
        
        for var i = 0; i < self.colCount; i += 1 {
            cellHeight[i] = self.sectionInset.top
        }
        //根据列数计算 cell 的宽度   总宽度减去 （列数 - 1） 个间隙   减去 左边距 减去 右边距   最后除以 列数
        //每一个cell 的宽度是相等的
        let w = (self.collectionView!.frame.size.width - 20 - CGFloat(colCount! - 1) * self.minimumInteritemSpacing - self.sectionInset.right - self.sectionInset.left) / CGFloat(colCount!)
        
        for var i = 0; i < self.shops?.count; i += 1 {
            //算出当前这个模型在第几列的位置
            let col = i % colCount!
            
            let model = self.shops![i] as? RANModel
            //根据图片的宽高比，算出显示时的高度
            let h = model!.h!.floatValue / model!.w!.floatValue * Float(w)
            //创建  UICollectionViewLayoutAttributes对象，设置其frame属性
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            let attr = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            //x  根据列数去算   如同九宫格
            let x = CGFloat(col) * (w + self.minimumInteritemSpacing)
            //y  要排放的这一列中  保存的  arr[col]的值 + 间隙
            let y = cellHeight[col] as? CGFloat
            
            attr.frame = CGRectMake(x, y!, w, CGFloat(h))
            //保存添加之后的值
            cellHeight[col] = y! + CGFloat(h) + self.minimumInteritemSpacing
            
            tempArray.addObject(attr)
        }
        //取出colHeight中最大的值，最长列的值
        var a : CGFloat = 0
        for var i = 0; i < self.colCount; i += 1 {
            let height = cellHeight[i] as! CGFloat
            a = height > a ? height : a
            
        }
        
        
        
        //难点
        //b值 % colCount 等于0   是大于总数，且最接近总局的值
        //保证每一列上都有同样多的cell
        var b : Int?
        
        for var i = 0; Float(i) < MAXFLOAT; i += 1 {
            if (shops!.count + i) % self.colCount! == 0{
                b = shops!.count + i
                break
            }
        }
        //itemSize 决定这collectionView的滚动范围，要想写的很精确，得需要用一段时间去计算并调试
        //最长的高度乘以列数除以 b 为一个 cell 的高度  没有间隙的情况下
        self.itemSize = CGSizeMake(w, (a * CGFloat(self.colCount!) - 3 * self.sectionInset.top) / CGFloat(b!)  - self.minimumLineSpacing)
        
        self.attributes = tempArray
        
    }
    /**
     *  返回 collectionView 所有item 属性的数组
     1.显示某个区域的时候，会计算出这个区域的item的属性
     
     在此方法中，数组里面存放的是 UICollectionViewLayoutAttributes对象，它的frame属性就是item的frame，决定这item显示在什么地方，根据位置的参差错落达到瀑布流的效果
     */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attributes as? [UICollectionViewLayoutAttributes]
    }

}
