//
//  ViewController.swift
//  MathDo
//
//  Created by Максим Горячкин on 06.01.2022.
//

import UIKit

class StartViewController: UITableViewController {
    
    let formulas = ["Ohm's law", "Integral", "Quadratic equation"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonSettings()
        setNavigationBarSettings()
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        formulas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = formulas[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let formulaVC = FormulaViewController()
        show(formulaVC, sender: nil)
    }
}

