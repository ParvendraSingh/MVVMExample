//
//  PostViewModel.swift
//  MVVMExample
//
//  Created by Parvendra Kumar on 02/08/23.
//

import Foundation

protocol PostViewModelProtocol {
    func reloadData()
}

class PostViewModel {
    var delegate: PostViewModelProtocol?
    private var posts: [PostModel] = []
    let postUrl = API().baseURL + API().postAPIEnd
    
   @MainActor func getPosts() {
       Task {
           do{
               let postResponse: [PostModel] = try await NetworkHandler.shared.request(url: postUrl)
               self.posts = postResponse
               self.delegate?.reloadData()
           }catch{
               // Error if any 
           }
       }
    }
    
    func userCount ()-> Int{
        return posts.count
    }
    
    func getPost(at index:Int) -> PostModel {
        let post = posts[index]
        return post
    }
}
