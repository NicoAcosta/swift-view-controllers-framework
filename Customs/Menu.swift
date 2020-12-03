//
//  Menu.swift
//  MyFramwork
//
//  Created by Nicolás Acosta on 02/12/2020.
//

import Foundation
import UIKit

class Menu: MenuViewController, Storyboardable {
    
    var myAppName : String? {
        return "AppName"
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    
    deinit{
        print()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appNameLabel.text = myAppName
        
        // Select the initial row
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UITableView.ScrollPosition.none)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //  Alto de fila = alto de tableView / cantidad de items -> aprovechar todo el alto posible
        let rows = menuContainerViewController?.contentViewControllers.count
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.size.height
        let tableViewHeight = safeAreaHeight - 400
        tableView.rowHeight = tableViewHeight / CGFloat(rows!)
        
    }
    
}
