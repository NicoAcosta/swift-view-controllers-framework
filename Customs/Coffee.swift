//
//  coffee.swift
//  MyFramework
//
//  Created by Nicolás Acosta on 02/12/2020.
//

import Foundation
import UIKit
import Fito

class Coffee : MyViewController, SideMenuItemContent, Storyboardable {
    
    var logoAssetName : String? {
        return nil
    }
    
    var nameAssetName : String? {
        return nil
    }
    
    func menu() {
        showSideMenu()
    }
    
    override var myUserInterfaceStyle: UIUserInterfaceStyle? {
        return .light
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var bigLogoImageView: UIImageView!
    @IBOutlet weak var nameLogoImageView: UIButton!
    
    @IBOutlet weak var buttonView: UIView!
    
}
