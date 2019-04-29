//
//  CommonUIController.swift
//  SQLConnectApp
//
//  Created by Apple on 29/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CommonUIController: UIViewController {
    static let shared = CommonUIController()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func commonUITextField (placeHolder:String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeHolder
        textField.textAlignment = .center
        textField.textColor = UIColor.darkGray
        textField.backgroundColor = UIColor.white
        textField.tintColor = UIColor.black
        textField.adjustsFontSizeToFitWidth = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    func commonLabelUI(text: String, color: UIColor,textColor:UIColor) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.text = text
        label.textColor = textColor
        label.backgroundColor = color
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    func commonInputButton(withColor color:UIColor, title:String,alphaVal:CGFloat,titleColor:UIColor) -> UIButton{
        let button = UIButton()
        button.backgroundColor = color
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = color.withAlphaComponent(alphaVal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.clipsToBounds = true
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }
    func commoninputStackView(arr: Array<Any>)-> UIStackView {
        //Stack View
        let stackView   = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 2
        stackView.backgroundColor = UIColor.blue
        
        for row in arr {
            stackView.addArrangedSubview(row as! UIView)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
extension UIViewController {
    
    func createAlert(titleText : String, messageText : String){
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
