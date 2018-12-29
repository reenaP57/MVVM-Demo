//
//  ProjectListTblCell.swift
//  MVVM Demo
//
//  Created by Mac-00010 on 26/12/18.
//  Copyright © 2018 Mac-00010. All rights reserved.
//

import UIKit

class ProjectListTblCell: UITableViewCell {

    @IBOutlet weak var lblPjctName : UILabel!
    @IBOutlet weak var lblLocation : UILabel!
    @IBOutlet weak var lblReraNo : UILabel!
    @IBOutlet weak var imgVPrjct : UIImageView!
    @IBOutlet weak var viewMainContainer : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
