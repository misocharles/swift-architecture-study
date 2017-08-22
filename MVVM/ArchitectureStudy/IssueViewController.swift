//
//  IssueViewController.swift
//  ArchitectureStudy
//
//  Created by Incheol-iMac on 2017. 8. 22..
//  Copyright © 2017년 misocharles. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController {
    
    var issueViewModel: IssueViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let issueViewModel = issueViewModel else {
            return
        }
    }
}
