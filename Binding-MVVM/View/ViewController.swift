//
//  ViewController.swift
//  Binding-MVVM
//
//  Created by Sinan on 25.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    var viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTableView()
        viewModel.fetchUser()
        
    }
    
    fileprivate func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        view.addSubview(tableView)
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = UIListContentConfiguration.groupedFooter()
        content.text = viewModel.users.value[indexPath.row].name
        content.secondaryText = viewModel.users.value[indexPath.row].email
        cell.contentConfiguration = content
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = User(name: "New User", email: "xxxx@email.com")
        viewModel.users.value.append(user)
    }
    
}

