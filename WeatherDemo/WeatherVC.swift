//
//  ViewController.swift
//  WeatherDemo
//
//  Created by Tomasz Piątek on 12/01/2023.
//

import UIKit

class WeatherVC: UIViewController {
    
    
    var textField = UITextField()
    var searchButton = UIButton()
    
    var labelCity = UILabel()
    var labelTemp = UILabel()
    
    var networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        tapToEnd()
        
        
        
        setupTextField()
        setupSearchButton()
        
        setupLabels()
    }
    
    func setupTextField() {
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: 180, height: 80))
        textField.placeholder = "City name"
        textField.backgroundColor = .systemGray6
        textField.returnKeyType = UIReturnKeyType.done
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.delegate = self
        
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
        ])
    }
    
    
    func setupSearchButton() {
        searchButton.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        searchButton.backgroundColor = .systemGray
        searchButton.setTitle("GO", for: UIControl.State.normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.layer.cornerRadius = 5

        view.addSubview(searchButton)

        searchButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func actionButton() {
        if let city = textField.text  {
            networkManager.cityName(cityName: city)
        }

    }
    
    
    func setupLabels() {
        labelCity.textAlignment = .center
        labelCity.font = UIFont.systemFont(ofSize: 20)
        labelCity.translatesAutoresizingMaskIntoConstraints = false
        labelCity.text = "Miasto"
        view.addSubview(labelCity)
        
        NSLayoutConstraint.activate([
            labelCity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelCity.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        labelTemp.textAlignment = .center
        labelTemp.font = UIFont.systemFont(ofSize: 100)
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.text = "10.0"
        view.addSubview(labelTemp)
        
        NSLayoutConstraint.activate([
            labelTemp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTemp.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75)
            
        ])
        
        
        
    }
}





extension WeatherVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text  {
            networkManager.cityName(cityName: city)
        }
        
    }

    func tapToEnd() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
}

