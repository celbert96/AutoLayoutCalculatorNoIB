//
//  ViewController.swift
//  AutoLayoutCalculatorNoIB
//
//  Created by Christopher Elbert on 6/27/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    // MARK: UI Setup
    
    fileprivate func setUpUI() {
        let outerStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = 0
            return stackView
        }()
        
        view.addSubview(outerStackView)
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        outerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        outerStackView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        outerStackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        let resultContainer = UIView()
        outerStackView.addArrangedSubview(resultContainer)
        
        let controlsContainer = UIView()
        outerStackView.addArrangedSubview(controlsContainer)
        controlsContainer.translatesAutoresizingMaskIntoConstraints = false
        controlsContainer.heightAnchor.constraint(equalTo: outerStackView.heightAnchor, multiplier: 0.66).isActive = true
        
        setUpResultContainer(resultContainer: resultContainer)
        setUpControlsContainer(controlsContainer: controlsContainer)
        
    }
    
    fileprivate func setUpResultContainer(resultContainer: UIView) {
        let resultLabel: UILabel = {
            let label = UILabel()
            label.text = "0"
            label.font = .systemFont(ofSize: 30)
            return label
        }()
        
        resultContainer.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.trailingAnchor.constraint(equalTo: resultContainer.trailingAnchor, constant: -8.0).isActive = true
        resultLabel.bottomAnchor.constraint(equalTo: resultContainer.bottomAnchor, constant: -8.0).isActive = true
        
    }
    
    fileprivate func setUpControlsContainer(controlsContainer: UIView) {
        let controlsStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 1
            return stackView
        }()
        
        // Row 1
        let rowOneButtonInfo: KeyValuePairs<String, UIColor> = [
            "Clear": .darkGray,
            "+/-": .darkGray,
            "%": .darkGray,
            "/": .red
        ]
        let rowOneStackView = createRowStackView(buttonInfo: rowOneButtonInfo)
        
        
        // Row 2
        let rowTwoButtonInfo: KeyValuePairs<String, UIColor> = [
            "1": .lightGray,
            "2": .lightGray,
            "3": .lightGray,
            "*": .red
        ]
        let rowTwoStackView = createRowStackView(buttonInfo: rowTwoButtonInfo)
        
        // Row 3
        let rowThreeButtonInfo: KeyValuePairs<String, UIColor> = [
            "4": .lightGray,
            "5": .lightGray,
            "6": .lightGray,
            "-": .red
        ]
        let rowThreeStackView = createRowStackView(buttonInfo: rowThreeButtonInfo)
        
        // Row 4
        let rowFourButtonInfo: KeyValuePairs<String, UIColor> = [
            "7": .lightGray,
            "8": .lightGray,
            "9": .lightGray,
            "+": .red
        ]
        let rowFourStackView = createRowStackView(buttonInfo: rowFourButtonInfo)
        
        // Row 5
        let rowFiveButtonInfo: KeyValuePairs<String, UIColor> = [
            "0": .lightGray,
            ".": .lightGray,
            "=": .red
        ]
        
        let rowFiveStackView = createRowStackView(buttonInfo: rowFiveButtonInfo)

        controlsStackView.addArrangedSubview(rowOneStackView)
        controlsStackView.addArrangedSubview(rowTwoStackView)
        controlsStackView.addArrangedSubview(rowThreeStackView)
        controlsStackView.addArrangedSubview(rowFourStackView)
        controlsStackView.addArrangedSubview(rowFiveStackView)
        
        controlsContainer.addSubview(controlsStackView)
        controlsStackView.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView.heightAnchor.constraint(equalTo: controlsContainer.heightAnchor).isActive = true
        controlsStackView.widthAnchor.constraint(equalTo: controlsContainer.widthAnchor).isActive = true
        controlsStackView.centerXAnchor.constraint(equalTo: controlsContainer.centerXAnchor).isActive = true
        controlsStackView.centerYAnchor.constraint(equalTo: controlsContainer.centerYAnchor).isActive = true
    }
    
    // MARK: Helper Functions
    
    fileprivate func createRowStackView(buttonInfo: KeyValuePairs<String, UIColor>) -> UIStackView {
        let rowStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 1
            return stackView
        }()
        
        for (title, color) in buttonInfo {
            let btn = createCalculatorButton(title: title, backgroundColor: color)
            rowStackView.addArrangedSubview(btn)
        }
        
        return rowStackView
    }
    
    fileprivate func createCalculatorButton(title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = backgroundColor
        return button
    }
}
