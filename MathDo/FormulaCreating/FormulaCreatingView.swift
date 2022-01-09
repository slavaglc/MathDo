//
//  FormulaCreatingView.swift
//  MathDo
//
//  Created by Вячеслав Макаров on 09.01.2022.
//

import UIKit


final class FormulaCreatingView: UIView {

    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var formulaTextField: UITextField  = {
        let formulaTextField = UITextField()
        formulaTextField.translatesAutoresizingMaskIntoConstraints = false
        formulaTextField.borderStyle = .line
        formulaTextField.placeholder = "Write your formula"
        return formulaTextField
    }()
    
    private lazy var variablesTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 10, y: 10, width: 100, height: 100
                                                 ), style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var addVariableButton: UIButton = {
        let addVariableButton = UIButton()
        addVariableButton.translatesAutoresizingMaskIntoConstraints = false
        addVariableButton.setTitle("New variable", for: .normal)
        addVariableButton.layer.cornerRadius = 10
        addVariableButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        addVariableButton.tintColor = .white
        return addVariableButton
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .white
        stackView.addArrangedSubview(formulaTextField)
        stackView.addArrangedSubview(variablesTableView)
        stackView.addArrangedSubview(addVariableButton)
        addSubview(stackView)
        setStackViewSettings()
        setFormulaTextFieldSettings()
        setVariablesTableViewSettings()
        setAddVariableButtonSettings()
    }
    
    private func setStackViewSettings() {
        let padding = 10.0
       stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
       stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
       stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
       stackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: -padding).isActive = true
    }
    
    private func setFormulaTextFieldSettings() {
        formulaTextField.heightAnchor.constraint(equalToConstant: frame.width / 7).isActive = true
        formulaTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor ).isActive = true
    }
    
    private func setVariablesTableViewSettings() {
        variablesTableView.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        variablesTableView.separatorStyle = .none
    }
    
    private func setAddVariableButtonSettings() {
        addVariableButton.heightAnchor.constraint(equalToConstant: frame.width / 7).isActive = true
        addVariableButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        addVariableButton.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension FormulaCreatingView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Variables"
    }
    
    
}
