//
//  ServiceSP.swift
//  SQLConnectApp
//
//  Created by Apple on 29/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ServiceSP: NSObject {
    let client = SQLClient.sharedInstance()!
    func initConnect(ip:String,username:String,pass:String,db:String,onSuccess: @escaping ((Any)->Void)) {
        client.connect(ip, username: username, password: pass, database: db) { success in
            print("\(ip)===dbb==\(success)")
            onSuccess(success)
        }
    }
    func executeTheQuery(spquery:String, onSuccess: @escaping(_ results: (Any)) -> Void, onFailure: @escaping(Any) -> Void){
        client.execute(spquery, completion: { (_ results: (Any)) in
            if results != nil {
                onSuccess(results)
            }else {
                onFailure("Unable to get info")
            }
            //self.client.disconnect()
        })
    }
    func disConnect(){
        self.client.disconnect()
    }
}
