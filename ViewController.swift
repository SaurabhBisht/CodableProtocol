//
//  ViewController.swift
//  CodableProtocol
//
//  Created by Saurabh Bisht on 18/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        ServiceInvoker.invokeLogin(url:  URL(string: "https://dummyjson.com/auth/login")!, requestData: UserLoginModel.RequestData(username: "kminchelle", password: "0lelplR")) { result in
            
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
            
        }
    }


}

