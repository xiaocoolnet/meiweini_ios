//
//  LocationViewController.swift
//  MWN_user_2016
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

protocol CityViewControllerDelegate{
    func selectCity(city:String);
}

class LocationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate,LocationManagerDelegate {

    @IBOutlet weak var topLine: NSLayoutConstraint!
    @IBOutlet weak var searchCity: UISearchBar!
    
    var myCityTable = UITableView()
    
    //城市管理
    var locationManager:LocationManager!
    //当前定位城市名称
    var cityName:String = "正在获取..."
    //城市数据库
    var dict:NSMutableDictionary!
    //所有城市名称
    var cityArray:NSMutableArray!
    //所有城市拼音首字母
    var citySpell:NSMutableArray!
    //所有城市拼音首字母
    var sectionCitySpell:NSMutableArray!
    //搜索到得城市
    var searchCityArray:NSArray!
    //最近访问城市
    var historyCitys = ["北京","上海","广州"]
    //热门城市
    let hotCitys = ["上海","北京","广州","深圳","武汉","天津","西安","南京","杭州"]
    
    /** 回调接口*/
    var delegate:CityViewControllerDelegate?
    //最近访问城市数据
    var dataHistoryCitys:SpecifyArray!
    let keyHistory = "keyHistory"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.hidden = true

        myCityTable.frame = CGRectMake(0, 44, WIDTH, HEIGHT-44)
        myCityTable.delegate = self
        myCityTable.dataSource = self
        myCityTable.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(myCityTable)
        
        myCityTable.rowHeight = 70
        
        cityArray = NSMutableArray()
        citySpell = NSMutableArray()
        searchCityArray = NSArray()
        dataHistoryCitys = SpecifyArray(max: 3)
        
        getCityData()
        
        
        // Do any additional setup after loading the view.
    }

    /**
     装在城市数据信息
     */
    private func getCityData(){
        //获取当前城市
        locationManager = LocationManager()
        locationManager.delegate = self
        locationManager.startLocationCity()
        //获取最近放问城市
        let object = NSUserDefaults.standardUserDefaults().arrayForKey(keyHistory)
        if(object == nil){
            self.dataHistoryCitys.addObject("北京")
        }else{
            self.dataHistoryCitys.addArray(object!)
        }
        self.historyCitys = self.dataHistoryCitys.getaArray() as! [String]
        
        let path = NSBundle.mainBundle().pathForResource("citydict", ofType: "plist")
        self.dict = NSMutableDictionary(contentsOfFile: path!)
        let key:NSArray = self.dict.allKeys
        self.citySpell.addObjectsFromArray(key.sortedArrayUsingSelector(#selector(NSNumber.compare(_:))))
        self.sectionCitySpell = NSMutableArray()
        self.sectionCitySpell.addObjectsFromArray(["定位城市"])
        self.sectionCitySpell.addObjectsFromArray(self.citySpell as [AnyObject])
        let allValue:NSArray = self.dict.allValues
        for oneArr in allValue{
            for cityName in oneArr as! NSArray{
                self.cityArray.addObject(cityName)
            }
        }
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if(!myCityTable.isEqual(tableView)){ //搜索结果时
            return 1;
        }
        return self.sectionCitySpell.count;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            let key:NSString = self.sectionCitySpell.objectAtIndex(section) as! NSString
            return dict.objectForKey(key)!.count
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(table: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let lab = UILabel(frame: CGRectMake(10, 2, 150, 16))
        lab.font = UIFont.systemFontOfSize(13)
        lab.textColor = GREY
        view.addSubview(lab)
        if(!myCityTable.isEqual(table)){ //搜索结果时
            lab.text = citySpell.objectAtIndex(section)as?String
        }else{
            lab.text = sectionCitySpell.objectAtIndex(section) as? String
        }
        view.backgroundColor = RGREY
        return view;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as!TableViewCell
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        if indexPath.section == 0 {
            cell.textLabel?.text = cityName
            
        }else{
            //添加数据
            var key:NSString = ""
            if(myCityTable.isEqual(tableView)){
                key = sectionCitySpell.objectAtIndex(indexPath.section) as! NSString
                cell.setData(dict.objectForKey(key)!.objectAtIndex(indexPath.row) as! String)
            }else{
                cell.setData(searchCityArray.objectAtIndex(indexPath.row) as! String)
            }

        }
       
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if(self.delegate != nil ){
            var cityName:String = ""
            if(indexPath.section == 0){
                cityName = self.searchCityArray.objectAtIndex(indexPath.row) as! String
            }else{
                let section = indexPath.section
                if(section > 0){//列表城市
                    let key:NSString = sectionCitySpell.objectAtIndex(section) as! NSString
                    cityName = dict.objectForKey(key)!.objectAtIndex(indexPath.row) as! String
                    
                }
                print(cityName)
            }
            self.selectCity(cityName)
        }

        
    }
    
//    /** 对城市名称进行排序*/
//    private func cityNameSort(str1:NSString,str2:String,context:Void)->NSComparisonResult{
//        return str1.localizedCompare(str2)
//    }
//    private func handlerSearch(searchString:String?){
//        if(searchString == nil){
//            return;
//        }
//        
//        //判断是否清空数据
//        if(searchString!.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0){
//            let array:NSArray = self.cityArray;
//            let result:NSArray = ZYPinYinSearch.searchWithOriginalArray(array as [AnyObject], andSearchText: searchString, andSearchByPropertyName: "");
//            self.searchCityArray = result.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)));
//        }else{ //清空数据
//            
//        }
//    }
//    

    /**
     将选中城市名称返回并关闭当前页面
     - parameter city: 城市名称
     */
    private func selectCity(city:String){
        
        if(self.delegate != nil){
            dataHistoryCitys.addObject(city)
            NSUserDefaults.standardUserDefaults().setObject(dataHistoryCitys.getaArray(), forKey: keyHistory)
            self.delegate!.selectCity(city)
            self.dismissViewControllerAnimated(true , completion: { () -> Void in
            })
        }
        
    }
    
    //////////////////// LocationManagerDelegate  ////////////////////
    
    /**
     获取到当前城市
     - parameter cityName: 城市名称
     */
    func locationCity(cityName: String) {
        self.cityName = cityName;
        let indexPath:NSIndexPath = NSIndexPath(forRow: 0, inSection: 0);
        myCityTable.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None);
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
