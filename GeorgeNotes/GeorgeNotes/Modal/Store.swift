//
//  Store.swift
//  GeorgeNotes
//
//  Created by george on 19/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class Store
{
    private var Users: [User]
    
    init()
    {
        self.Users = [User]()
    }
}


//MARK:- Work func
extension Store
{
    func addUser(login: String, _ password: String, _ surname: String?, _ name: String?, _ image: UIImage?) -> Bool
    {
        for i in 0 ..< Users.count
        {
            if Users[i].login == login
            {
                return false
            }
        }
        
        Users.append(User(login, password, surname, name, image))
        return true
    }
    
    func removeUser(login: String, _ password: String) -> Bool
    {
        for i in 0 ..< Users.count
        {
            if Users[i].login == login
            {
                if Users[i].password == password
                {
                    Users.removeAtIndex(i)
                    return true
                }
            }
        }
        
        return false
    }
    
    func findUser(login: String, _ password: String) -> User?
    {
        for i in 0 ..< Users.count
        {
            if Users[i].login == login && Users[i].password == password
            {
                return Users[i]
            }
        }
        
        return nil
    }
}

//MARK:- Проверка данных
extension Store
{
    func checkData(login: String, _ password: String, _ surname: String, _ name: String) -> Bool
    {
        if login == "" || password == ""
        {return false}
        return true
    }
}














