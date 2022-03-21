//
//  EntryViewController.swift
//  Tasks
//
//  Created by Никита Коголенок on 17.03.22.
//

import UIKit

class EntryViewController: UIViewController {
    
    // MARK: Variable
    var update: (() -> Void)?
    
    // MARK: - Outlet
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDelegateAndOther()
    }
    
    // MARK: - Method
    func createDelegateAndOther() {
        textField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    // MARK: - Action
    @objc func saveTask() {
        guard let text = textField.text, !text.isEmpty else { return }
        
        guard let  count = UserDefaults().value(forKey: "count") as? Int else { return }
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
}
