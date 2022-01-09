//
//  ViewController.swift
//  MathDo
//
//  Created by Максим Горячкин on 06.01.2022.
//

import UIKit

class StartViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonSettings()
        setNavigationBarSettings()
        view.backgroundColor = .white
      
        
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "Hello World!"
        
        view.addSubview(label)
    }
    
    @objc private func routeToFomulaCreatingVC() {
        let formulaCreatingVC = FormulaCreatingViewController()
        show(formulaCreatingVC, sender: nil)
    }
    
    private func setButtonSettings() {
        let addItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(routeToFomulaCreatingVC))
        navigationItem.rightBarButtonItem = addItem
    }
    
    private func setNavigationBarSettings() {
        navigationItem.title = "MathDo"
    }
}

