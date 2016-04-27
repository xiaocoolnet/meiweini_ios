//
//  ChildsViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class ChildsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    private let reuseIdentifier = "child"
    private var collectionView: UICollectionView?
    private var array: [Int] = []
    //    var picArr:[String] = ["kb1.png","kb2.png","kb3.png","kb4.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = RGREY
        
        self.createCollectionView()
        
        // Do any additional setup after loading the view.
    }
    //  ------CollectionView------
    func createCollectionView() {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .Vertical
        flowlayout.itemSize = CGSize(width: (UIScreen.mainScreen().bounds.width-30) / 2, height: (UIScreen.mainScreen().bounds.width-40) / 2)
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        flowlayout.minimumInteritemSpacing = 0.0;
        flowlayout.minimumLineSpacing      = 0.0;
        collectionView = UICollectionView(frame: CGRectMake(0, 10, WIDTH, HEIGHT-115), collectionViewLayout: flowlayout)
        
        for i in 0...30 {
            array.append(i)
        }
        
        // 设置代理
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        // 注册
        collectionView?.registerClass(ChildCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        if let collectionView = collectionView {
            collectionView.backgroundColor = UIColor.whiteColor()
            view.addSubview(collectionView)
        }
        
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: ChildCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ChildCollectionViewCell
        cell.sizeToFit()
        
        cell.imageView?.image = UIImage(named: "kb\(indexPath.row+1).png")
        cell.name?.text = "科比\(array[indexPath.row])"
        cell.number.text = "\(array[indexPath.row]).0万"
        cell.contact.text = "最后的王者\(array[indexPath.row])"
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        let nextView = NextViewViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
