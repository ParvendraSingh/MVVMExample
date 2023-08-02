//
//  UserModel.swift
//  MVVMExample
//
//  Created by Parvendra Kumar on 02/08/23.
//

import Foundation

struct UserModel: Decodable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var phone: String?
    var website: String?
    var address: UserAddress?
    var company: UserCompany?    
}

struct UserGeoLocation: Decodable {
    var lat: String?
    var lng: String?
}
struct UserAddress: Decodable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: UserGeoLocation?
}

struct UserCompany: Decodable {
    var name: String?
    var catchPhrase: String?
    var bs: String?
}
