//
//  UserLoginModel.swift
//  CodableProtocol
//
//  Created by Saurabh Bisht on 18/11/23.
//

import Foundation

struct UserLoginModel {
    struct RequestData: Encodable {
        let username: String
        let password: String
    }
    
    struct ReponseData: Decodable {
        let id: Int
        let user_name: String
        let email: String
        let first_Name: String
        let lastName: String
        let gender: String
        let image: String
        let token: String
        
        enum CodingKeys: CodingKey {
            case id
            case user_name
            case email
            case first_Name
            case lastName
            case gender
            case image
            case token
        }
        
        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<UserLoginModel.ReponseData.CodingKeys> = try decoder.container(keyedBy: UserLoginModel.ReponseData.CodingKeys.self)
            self.id = try container.decode(Int.self, forKey: UserLoginModel.ReponseData.CodingKeys.id)
            self.user_name = try container.decode(String.self, forKey: UserLoginModel.ReponseData.CodingKeys.user_name)
            self.email = try container.decode(String.self, forKey: UserLoginModel.ReponseData.CodingKeys.email)
            self.first_Name = try container.decode(String.self, forKey: UserLoginModel.ReponseData.CodingKeys.first_Name)
            self.lastName = try container.decode(String.self, forKey: UserLoginModel.ReponseData.CodingKeys.lastName)
            self.gender = try container.decode(String.self, forKey: UserLoginModel.ReponseData.CodingKeys.gender)
            self.image = try container.decode(String.self, forKey: UserLoginModel.ReponseData.CodingKeys.image)
            self.token = try container.decode(String.self, forKey: UserLoginModel.ReponseData.CodingKeys.token)
        }
    }
}
