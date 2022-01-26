//
//  FormulaView.swift
//  MathDo
//
//  Created by Максим Горячкин on 19.01.2022.
//

import UIKit

class FormulaView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.image = UIImage(systemName: "formula")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(stackView)
        setStackViewSettings()
        stackView.addSubview(imageView)
        setImageViewSettings()
    }
    
    private func setStackViewSettings() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor))
        constraints.append(stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)
//        let padding = 0.0
//        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
//        stackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: -padding).isActive = true
    }
    
    private func setImageViewSettings() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(imageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 50))
        constraints.append(imageView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor))
        constraints.append(imageView.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(imageView.heightAnchor.constraint(equalToConstant: 50))
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
