//
//  FormulaViewController.swift
//  MathDo
//
//  Created by Максим Горячкин on 12.01.2022.
//

import UIKit

class FormulaViewController: UIViewController {
    
    var formula: Formula!
    let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    
    lazy var formulaView: UIView = { FormulaView() }()
    
    override func loadView() {
        view = formulaView
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        view.addSubview(label)
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationItem.title = formula.name
//        navigationController?.navigationBar.prefersLargeTitles = true
//        label.text = formula.body
//    }

}
