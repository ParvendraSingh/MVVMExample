//
//  PostViewController.swift
//  MVVMExample
//
//  Created by Parvendra Kumar on 03/08/23.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    let postViewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initViewModel()
    }
    
    func initViewModel (){
        postViewModel.delegate = self
        postViewModel.getPosts()
    }
}

extension PostViewController: PostViewModelProtocol {
    func reloadData() {
        self.postTableView.reloadData()
    }
}

extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.userCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        
        let post = postViewModel.getPost(at: indexPath.row)
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
}

