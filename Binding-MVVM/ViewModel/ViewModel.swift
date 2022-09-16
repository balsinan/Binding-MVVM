//
//  ViewModel.swift
//  Binding-MVVM
//
//  Created by Sinan on 26.10.2021.
//

import Foundation

protocol UserViewModelProtocol {
    func fetchUser()
    var users: Observable<[User]> { get  set }
    
}

struct UserListViewModel: UserViewModelProtocol{
    var users: Observable<[User]> = Observable([])
    var service: UserInfoService = UserInfoService()
    
    func numberOfRowsInSection() -> Int{
        return users.value.count
    }
    
    func didSelect(){
        let user = User(name: "New User", email: "xxxx@email.com")
        users.value.append(user)
    }
    
    func fetchUser() {
        service.fetchUsers { userModelList in
            users.value = userModelList
        } onFail: { error in
            print(error)
            
        }
        
    }
    
}
 
