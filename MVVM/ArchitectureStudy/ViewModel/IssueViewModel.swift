//
//  IssueViewModel.swift
//  ArchitectureStudy
//
//  Created by Incheol-iMac on 2017. 8. 17..
//  Copyright © 2017년 misocharles. All rights reserved.
//

import Foundation

struct IssueViewModel {
    private var issue: Issue
    
    var titleText: String {
        return issue.title
    }
    
    var numberText: String {
        return "#\(issue.number)"
    }
    
    init(issue: Issue) {
        self.issue = issue
    }
}
