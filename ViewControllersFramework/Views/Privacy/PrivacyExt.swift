//
//  PrivacyExt.swift
//  MyFramework2
//
//  Created by Nicolás Acosta on 03/12/2020.
//

import Foundation

extension Privacy {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadPage(URLString: myURL)
        
    }
    
    @IBAction func menu(_ sender: Any) {
        menu()
    }
    
}
