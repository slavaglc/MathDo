//
//  FomulaCreatingViewController.swift
//  MathDo
//
//  Created by Вячеслав Макаров on 09.01.2022.
//

import UIKit


 final class FormulaCreatingViewController: UIViewController {

     private lazy var formulaCreatingView: FormulaCreatingView = { FormulaCreatingView(viewController: self) }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGUI()
    }
     
     override func loadView() {
         view = formulaCreatingView
     }
     
    @objc func readFormula(sender: UIButton) {
//        print("result:", FormulaReader.shared.getResult(formulaCreatingView.formulaTextField.text ?? ""))
        FormulaReader.shared.correctInputExpression(expression: &formulaCreatingView.formulaTextField.text)
        FormulaReader.shared.verifyFormulaSyntax(expression: formulaCreatingView.formulaTextField.text ?? "") { success, error in
            
        }
     }
     
     private func setupGUI() {
         navigationItem.title = "Formula creating"
         let addItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(readFormula(sender:)))
         navigationItem.rightBarButtonItem = addItem
     }

}
