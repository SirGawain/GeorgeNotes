//
//  User.swift
//  GeorgeNotes
//
//  Created by george on 19/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class User
{
    var login: String
    var password: String
    var surname: String
    var name: String
    var image: UIImage
    var Notes: [Note]
    
    init (_ login: String, _ password: String, _ surname: String?, _ name: String?, _ image: UIImage?)
    {
        self.login = login
        self.password = password
        self.Notes = [Note]()
        
        if surname == nil || surname == ""
            {self.surname = "No surname"}
        else
            {self.surname = surname!}
        
        if name == nil || name == ""
            {self.name = "No name"}
        else
            {self.name = name!}
        
        if image != nil
            {self.image = image!}
        else
            {self.image = UIImage(named: "NoUserImage")!}
        
        let text = "Здравствуйте! Это ваша первая заметка в приложении Notes. Отредактируйте или удалите её. Спасибо, что используете программное обеспечение компании George."
        
        addNote("Первая заметка!", text, UIImage(named: "firstNote"))
    }
}


//MARK:- Work func
extension User
{
    func addNote(title: String, _ text: String?, _ image: UIImage?)
    {
        Notes.append(Note(title, text, image))
    }
    
    func removeNote(id: String) -> Bool
    {
        for i in 0 ..< Notes.count
        {
            if Notes[i].id == id
            {
                Notes.removeAtIndex(i)
                return true
            }
        }
        
        return false
    }
}