//
//  EntryViewController+Ext.swift
//  Tasks
//
//  Created by Никита Коголенок on 17.03.22.
//

import UIKit

extension EntryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true
    }
}
