//
//  AuthorizationController.swift
//  GeorgeNotes
//
//  Created by george on 19/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class AuthorizationController: UIViewController
{
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var tempUser: User? = User("","","","",nil)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func tryEnterClick(sender: AnyObject)
    {
        let login = loginField.text!
        let password = passwordField.text!
        tempUser = store.findUser(login,password)
        
        if tempUser != nil
        {
            performSegueWithIdentifier("GoToPersonalPage", sender: nil)
        }
        else
        {
            MessageBox("Ошибка!","Неверное имя пользователя или пароль.")
        }
    }

}

//MARK:- Скрыть клавиатуру
extension AuthorizationController
{
    func hideKeyboardWhenTappedAround()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegistrationController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

//MARK:- Переходы
extension AuthorizationController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "GoToPersonalPage"
        {
            let destination = segue.destinationViewController as! PersonalPageController
            destination.tempUser = tempUser!
        }
    }
}

//MARK:- Сообщение об ошибке
extension AuthorizationController
{
    func MessageBox(title: String, _ message: String)
    {
        let messangeBox1 = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "ОК", style: .Default)
        {
            (action) in
        }
        messangeBox1.addAction(okAction)
        presentViewController(messangeBox1, animated: true, completion: nil)
    }
}