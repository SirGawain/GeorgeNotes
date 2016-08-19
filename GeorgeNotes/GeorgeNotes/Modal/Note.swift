//
//  Note.swift
//  GeorgeNotes
//
//  Created by george on 19/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class Note
{
    var id: String
    var title: String
    var text: String
    var image: UIImage
    
    init (_ title: String, _ text: String?, _ image: UIImage?)
    {
        self.title = title
        self.id = NSUUID().UUIDString
        
        if text != nil
        {self.text = text!}
        else
        {self.text = "No text"}
        
        if image != nil
        {self.image = image!}
        else
        {self.image = UIImage(named: "NoNoteImage")!}
    }
}
