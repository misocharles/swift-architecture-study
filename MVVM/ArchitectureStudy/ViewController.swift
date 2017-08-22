//
//  ViewController.swift
//  ArchitectureStudy
//
//  Created by Incheol-iMac on 2017. 7. 31..
//  Copyright © 2017년 misocharles. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var issueData: [IssueViewModel] = [IssueViewModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestIssues()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? NSIndexPath, let issueVC = segue.destination as? IssueViewController else {
            return
        }
        issueVC.issueViewModel = issueData[indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath)
        let issueViewModel = issueData[indexPath.row]
        cell.textLabel?.text = issueViewModel.titleText
        cell.detailTextLabel?.text = issueViewModel.numberText
        return cell
    }
}

extension ViewController {
    func requestIssues() {
        let urlString = "https://api.github.com/repos/lkzhao/Hero/issues"
        Alamofire.request(urlString).responseJSON { (response) in
            if let json = response.result.value as? [Dictionary<String, Any>] {
                var tempIssueData = [IssueViewModel]()
                for data in json {
                    if let title = data["title"] as? String, let number = data["number"] as? Int {
                        let issue = Issue(title: title, number: number)
                        let issueViewModel = IssueViewModel(issue: issue)
                        tempIssueData.append(issueViewModel)
                    }
                }
                self.issueData = tempIssueData
            }
        }
    }
}
