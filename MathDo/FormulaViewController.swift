//
//  FormulaViewController.swift
//  MathDo
//
//  Created by Максим Горячкин on 12.01.2022.
//

import UIKit

class FormulaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "Hello World!"
        
        view.addSubview(label)
    }

}
