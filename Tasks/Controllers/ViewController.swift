//
//  ViewController.swift
//  Tasks
//
//  Created by Никита Коголенок on 17.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var arrayTasks = [String]()
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        createDelegates()
        saveInUserDefaults()
        updateTasks()
    }
    
    // MARK: - Methods
    func createDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func saveInUserDefaults() {
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
    }
    
    func updateTasks() {
        arrayTasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else { return }
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x + 1)") as? String {
                arrayTasks.append(task)
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Action
    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
