//
//  RegistrationController.swift
//  GeorgeNotes
//
//  Created by george on 19/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var imageUser: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func addImageClick(sender: AnyObject)
    {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        imageUser.layer.cornerRadius = 25.0
        imageUser.clipsToBounds = true
    }
    
    @IBAction func createUserClick(sender: AnyObject)
    {
        let login: String = loginField.text!
        let password: String = passwordField.text!
        let name: String = nameField.text!
        let surname: String = surnameField.text!
        let image: UIImage = imageUser.image!
        
        if store.checkData(login, password, surname,name) == true
        {
            if store.addUser(login, password, name, surname, image) == true
            {
                MessageBox("Поздравляем!", "Вы успешно прошли регистрацию.")
                loginField.text = ""
                passwordField.text = ""
                surnameField.text = ""
                nameField.text = ""
                imageUser.image = UIImage(named: "NoUserImage")
                tabBarController!.selectedIndex = 0
            }
            else
            {
                MessageBox("Ошибка!","Аккаунт с таким логином уже существует.")
            }
        }
        else
        {
            MessageBox("Ошибка!","Заполните логин и пароль.")
        }

    }
}

//MARK:- Методы UIImagePickerController
extension RegistrationController
{
    //Если пользователь выбирет фото
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageUser.contentMode = .ScaleAspectFit
            imageUser.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Если пользователь нажмет "отмена"
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

//MARK:- Скрыть клавиатуру
extension RegistrationController
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


//MARK:- Сообщение об ошибке
extension RegistrationController
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
