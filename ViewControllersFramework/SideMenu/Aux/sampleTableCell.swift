//
//  sampleTableCell.swift
//  MyFramwork
//
//  Created by Nicolás Acosta on 02/12/2020.
//

import Foundation
import UIKit


open class SampleTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var selectedView: UIView!
    
    var selectedTitleColor : UIColor {
        return .white
    }
    
    var notSelectedTitleColor : UIColor {
        return .systemGray2
    }
    
    var selectedViewColor : UIColor {
        return .white
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectedView.backgroundColor = selected ? selectedViewColor : UIColor.clear
        titleLabel.textColor = selected ? selectedTitleColor : notSelectedTitleColor
        titleLabel.font = selected ? UIFont(name: "GothamMedium", size: 30) : UIFont(name: "GothamLight", size: 25)
        
    }
}
