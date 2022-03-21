//
//  TaskViewController.swift
//  Tasks
//
//  Created by Никита Коголенок on 17.03.22.
//

import UIKit

class TaskViewController: UIViewController {
    
    // MARK: - Variable
    var task: String?
    
    // MARK: - Outlet
    @IBOutlet var label: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    // MARK: - Action
    @objc func deleteTask() {
    }
    
}
