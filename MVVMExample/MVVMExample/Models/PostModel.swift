//
//  PostModel.swift
//  MVVMExample
//
//  Created by Parvendra Kumar on 02/08/23.
//

import Foundation

struct PostModel: Decodable {
    var userId: Int?
    var id : Int?
    var title : String?
    var body : String?
}
