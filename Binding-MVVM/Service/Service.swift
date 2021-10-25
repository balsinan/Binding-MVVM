//
//  Service.swift
//  Binding-MVVM
//
//  Created by Sinan on 25.10.2021.
//

import Foundation

protocol UserInfoProtocol{
    func fetchUsers(onSuccess: @escaping([User])-> Void, onFail:@escaping (String?)-> Void)
}

enum UserInfoPath: String{
    case user = "https://jsonplaceholder.typicode.com/users"
}

struct UserInfoService: UserInfoProtocol {
    func fetchUsers(onSuccess: @escaping ([User]) -> Void, onFail: @escaping (String?) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: UserInfoPath.user.rawValue)!) { data, response, error in
            
            if let error = error{
                onFail(error.localizedDescription)
            }else{
                guard let data = data else {return}
                do{
                    let userModels = try JSONDecoder().decode([User].self, from: data)
                    
                    onSuccess(userModels)
                }catch{
                    
                }
            }
            
        }.resume()
        
    }

}


