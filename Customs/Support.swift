//
//  support.swift
//  MyFramework
//
//  Created by Nicolás Acosta on 02/12/2020.
//

import Foundation
import UIKit
import Fito


class Support : MyViewController, SideMenuItemContent, Storyboardable {
    
    var mailRecipients : [String]? {
        return ["app@app.com"]
        
    }
    
    var sendColor : UIColor {
        return .black
    }
    
    func menu() {
        showSideMenu()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //  Para saber cuando se esta editando meesageField, para mover view y que no se corte
    var activeTextView : UITextView? = nil
    
    //  View vacía para poder calcular el límite inferior de messageField
    @IBOutlet weak var belowMessageFieldView: UIView!
    
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var messageField: UITextView!
    @IBOutlet weak var mailButton: UIButton!
    
}
