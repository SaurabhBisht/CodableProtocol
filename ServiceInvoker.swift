//
//  ServiceInvoker.swift
//  CodableProtocol
//
//  Created by Saurabh Bisht on 18/11/23.
//

import Foundation


class ServiceInvoker {
    static func invokeLogin(url: URL, requestData: UserLoginModel.RequestData, completion: @escaping (Result<UserLoginModel.ReponseData, Error>)->Void) {
        
        let encoder = JSONEncoder()
        var req = URLRequest(url: url)
        req.httpMethod = "post"
        do {
            req.httpBody = try encoder.encode(requestData)
        }catch(let error) {
            print(error)
        }
        
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: req) { data, reponse, error in
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let resp = try decoder.decode(UserLoginModel.ReponseData.self, from: data!)
                completion(.success(resp))
            } catch(let err) {
                completion(.failure(err))
            }
        }.resume()
    }
}
