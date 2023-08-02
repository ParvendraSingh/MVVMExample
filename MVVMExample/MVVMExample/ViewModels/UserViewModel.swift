//
//  UserViewModel.swift
//  MVVMExample
//
//  Created by Parvendra Kumar on 02/08/23.
//

import Foundation

protocol UserViewModelProtocol {
    func reloadData()
}

class UserViewModel {
    var delegate: UserViewModelProtocol?
    private var user: [UserModel] = []
    let userUrl = API().baseURL + API().userAPIEnd
    
   @MainActor func getUsers() {
       Task {
           do{
               let userResponse: [UserModel] = try await NetworkHandler.shared.request(url: userUrl)
               self.user = userResponse
               self.delegate?.reloadData()
           }catch{
               print(error)
           }
       }
    }
    
    func userCount ()-> Int{
        return user.count
    }
    
    func getUser(at index:Int) -> UserModel {
        let user = user[index]
        return user
    }
}
