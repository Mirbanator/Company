//
//  DepartmentCell.swift
//  Comp
//
//  Created by Miro Wallin on 20/02/17.

import UIKit

class DepartmentCell:UITableViewCell {
@IBOutlet weak var dname: UILabel!

    var department: Department! {
        didSet{
            dname.text = department.dname!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
