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
        
        if surname != nil
            {self.surname = surname!}
        else
            {self.surname = "No surname"}
        
        if name != nil
            {self.name = name!}
        else
            {self.name = "No name"}
        
        if image != nil
            {self.image = image!}
        else
            {self.image = UIImage(named: "NoUserImage")!}
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