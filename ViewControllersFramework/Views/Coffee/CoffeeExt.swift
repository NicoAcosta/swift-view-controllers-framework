//
//  CoffeeExt.swift
//  MyFramework2
//
//  Created by Nicolás Acosta on 03/12/2020.
//

import Foundation
import UIKit


extension Coffee {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        bigLogoImageView.image = UIImage(named: logoAssetName!)
        nameLogoImageView.imageView?.image = UIImage(named: nameAssetName!)
        
        buttonView.layer.cornerRadius = 5
        
    }
    
    @IBAction func menu(_ sender: Any) {
        menu()
    }
    
    @IBAction func coffeeAction(_ sender: Any) {
        openInSafari(URLString: "https://buymeacoffee.com/blackhackapp/")
    }
    
}
