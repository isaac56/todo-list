//
//  SideBarNavigation.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/15.
//

import Foundation
import SideMenu

class SideBarNavigation: SideMenuNavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentationStyle = .menuSlideIn
        self.menuWidth = 428
    }
}
