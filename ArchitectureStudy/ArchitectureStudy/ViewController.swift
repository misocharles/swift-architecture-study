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
    var issueData: [Issue] = [Issue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestIssues()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath)
        cell.textLabel?.text = issueData[indexPath.row].title
        cell.detailTextLabel?.text = "#\(issueData[indexPath.row].number)"
        return cell
    }
}

extension ViewController: UITableViewDelegate  {
    
}

extension ViewController {
    func requestIssues() {
        let urlString = "https://api.github.com/repos/lkzhao/Hero/issues"
        Alamofire.request(urlString).responseJSON { (response) in
            if let json = response.result.value as? [Dictionary<String, Any>] {
                for data in json {
                    if let title = data["title"] as? String, let number = data["number"] as? Int {
                        let issue = Issue(title: title, number: number)
                        self.issueData.append(issue)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
}
