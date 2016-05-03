//
//  TableViewCell.swift
//  MWN_user_2016
//
//  Created by apple on 16/5/3.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(cityName:String){
        self.textLabel!.text = cityName
    }


}
