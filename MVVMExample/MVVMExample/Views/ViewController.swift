//
//  ViewController.swift
//  MVVMExample
//
//  Created by Parvendra Kumar on 02/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var postTable: UITableView!
    let postViewModel = PostViewModel()
    let userViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //initViewModel()
          initUserModel()
    }
    
    func initViewModel (){
        // postViewModel.delegate = self
        postViewModel.getPosts()
    }
    
    func initUserModel (){
        userViewModel.delegate = self
        userViewModel.getUsers()
    }
}

extension ViewController: UserViewModelProtocol {
    func reloadData() {
        self.postTable.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return postViewModel.userCount()
        return userViewModel.userCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = userViewModel.getUser(at: indexPath.row)
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
        
//        let post = postViewModel.getPost(at: indexPath.row)
//        cell.textLabel?.text = post.title
//        cell.detailTextLabel?.text = post.body
//        return cell
    }
}

