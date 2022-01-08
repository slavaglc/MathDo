//
//  ViewController.swift
//  MathDo
//
//  Created by Максим Горячкин on 06.01.2022.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addItem = UIBarButtonItem(title: "Add")
        
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = addItem
        navigationItem.title = "MathDo"
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "Hello World!"
        
        view.addSubview(label)
    }


}

