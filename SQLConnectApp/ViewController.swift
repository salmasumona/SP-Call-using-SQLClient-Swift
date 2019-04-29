//
//  ViewController.swift
//  SQLConnectApp
//
//  Created by Apple on 29/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _ServiceSP = ServiceSP()
    let ip = CommonUIController.shared.commonUITextField(placeHolder: "IP Address")
    let username = CommonUIController.shared.commonUITextField(placeHolder: "Username")
    let password = CommonUIController.shared.commonUITextField(placeHolder: "Password")
    let dbname = CommonUIController.shared.commonUITextField(placeHolder: "Database Name")
    let connectBtn = CommonUIController.shared.commonInputButton(withColor: UIColor(red:90/255, green:185/255, blue:91/255, alpha:1.0), title: "Connect", alphaVal: CGFloat(1.0), titleColor: UIColor.darkGray)
    let spCallBtn = CommonUIController.shared.commonInputButton(withColor: UIColor.cyan, title: "SP Call", alphaVal: CGFloat(1.0), titleColor: UIColor.darkGray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        password.isSecureTextEntry = true
        ip.becomeFirstResponder()
        setupViews()
    }
    func setupViews(){
        connectBtn.addTarget(self, action: #selector(connectBtnTapped), for: .touchUpInside)
       // spCallBtn.addTarget(self, action: #selector(execuetQueryBtnTapped), for: .touchUpInside)
        let stackView = CommonUIController.shared.commoninputStackView(arr: [ip,username,password,dbname,connectBtn/*,spCallBtn*/])
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier:0.4),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier:0.5),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    @objc func connectBtnTapped (_ sender:UIButton){
        guard ip.text != "" else{self.createAlert(titleText: "", messageText: "Enter ip address."); return}
        guard username.text != "" else{self.createAlert(titleText: "", messageText: "Enter username."); return}
        guard password.text != "" else{self.createAlert(titleText: "", messageText: "Enter password."); return}
        guard dbname.text != "" else{self.createAlert(titleText: "", messageText: "Enter database name."); return}
        if ip.text! != "" && username.text! != "" && password.text! != "" && dbname.text! != ""
        {
            self._ServiceSP.disConnect()
            _ServiceSP.initConnect(ip: ip.text!, username: username.text!, pass: password.text!, db: dbname.text!) { (data) in
                print("data===\(data)")
            }
        }
    }
    @objc func execuetQueryBtnTapped(_ sender:UIButton){
        let param1 = ""
        let param2 = ""
         _ServiceSP.executeTheQuery(spquery:"EXEC Get_User '\(param1)','\(param2)'",onSuccess: { results   in
            print("results==\(results as! [Any])")
         }, onFailure: { error in
            self.createAlert(titleText: "", messageText: error as! String)
         })
    }
}

