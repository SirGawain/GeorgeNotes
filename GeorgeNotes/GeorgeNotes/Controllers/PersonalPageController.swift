//
//  PersonalPageController.swift
//  GeorgeNotes
//
//  Created by george on 19/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class PersonalPageController: UIViewController
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var BarName: UINavigationItem!
    
    var tempUser = User("","","","",nil)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameLabel.text = tempUser.name
        surnameLabel.text = tempUser.surname
        imageUser.image = tempUser.image
        BarName.title = tempUser.login
    }
}
