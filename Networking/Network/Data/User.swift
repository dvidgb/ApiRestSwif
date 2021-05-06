//
//  User.swift
//  Networking
//
//  Created by David Bueno on 5/5/21.
//

import Foundation
import Alamofire

/*
{
 "code": 200,
 "meta": null,
 "data": {
   "id": 123,
   "name": "Budhil Dubashi",
   "email": "xyz@mante.biz",
   "gender": "Male",
   "status": "Inactive",
   "created_at": "2021-05-05T03:50:05.368+05:30",
   "updated_at": "2021-05-05T09:52:20.893+05:30"
 }
}
 */

struct UserReponse: Decodable {
    
    //code -> propiedad json que es un entero
    let code: Int?
    let meta: Meta?
    let data: User?
}

struct User: Decodable {
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
    let createdAt: Date?
    let updatedAt: Date?
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case email
        case gender
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        
    }
}


struct Meta: Decodable {
    
}


