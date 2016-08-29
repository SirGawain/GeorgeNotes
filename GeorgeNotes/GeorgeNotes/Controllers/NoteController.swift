//
//  NoteController.swift
//  GeorgeNotes
//
//  Created by george on 19/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class NoteController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageNote: UIImageView!
    
    var flag: Bool = false
    let imagePicker = UIImagePickerController()
    
    var indexUser: Int = -1
    var indexNote: Int = -1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGrayColor().CGColor
        textView.layer.cornerRadius = 6
        
        imageNote.layer.borderWidth = 1
        imageNote.layer.borderColor = UIColor.lightGrayColor().CGColor
        imageNote.layer.cornerRadius = 6
        
        if indexUser == -1
        {
            titleField.text = ""
            textView.text = ""
        }
        else
        {
            titleField.text = store.Users[indexUser].Notes[indexNote].title
            textView.text = store.Users[indexUser].Notes[indexNote].text
            imageNote.image = store.Users[indexUser].Notes[indexNote].image
        }
    }
    
    @IBAction func addImage(sender: AnyObject)
    {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
}

//MARK:- Скрыть клавиатуру
extension NoteController
{
    func hideKeyboardWhenTappedAround()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NoteController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

//Скрол экрана при появлении клавиатуры
extension NoteController
{
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    
    override func viewDidDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func registerForKeyboardNotifications()
    {
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(NoteController.keyboardWillShow(_:)),
            name: UIKeyboardWillShowNotification,
            object: nil
        )
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(NoteController.keyboardWillHide(_:)),
            name: UIKeyboardWillHideNotification,
            object: nil
        )
    }
    
    func keyboardWillShow(notification: NSNotification)
    {
        if flag == false
        {
            adjustInsetForKeyboardShow(true, notification: notification)
            flag = true
        }
    }
    
    func keyboardWillHide(notification: NSNotification)
    {
        if flag == true
        {
            adjustInsetForKeyboardShow(false, notification: notification)
            flag = false
        }
    }
    
    func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
        guard let value = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = value.CGRectValue()
        let adjustmentHeight = (CGRectGetHeight(keyboardFrame) + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom += adjustmentHeight
        scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
    }
}

//MARK:- Методы UIImagePickerController
extension NoteController
{
    //Если пользователь выбирет фото
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageNote.contentMode = .ScaleAspectFit
            imageNote.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Если пользователь нажмет "отмена"
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
}





