//
//  FomulaCreatingViewController.swift
//  MathDo
//
//  Created by Вячеслав Макаров on 09.01.2022.
//

import UIKit


 final class FormulaCreatingViewController: UIViewController {

     private lazy var formulaCreatingView: UIView = { FormulaCreatingView() }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGUI()
    }
     
     override func loadView() {
         view = formulaCreatingView
     }
     
     private func setupGUI() {
         navigationItem.title = "Formula creating"
     }

}
