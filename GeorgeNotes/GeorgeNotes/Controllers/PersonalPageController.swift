//
//  PersonalPageController.swift
//  GeorgeNotes
//
//  Created by george on 19/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class PersonalPageController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var BarName: UINavigationItem!
    
    var indexUser: Int = -1
    var indexNote: Int = -1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameLabel.text = store.Users[indexUser].name
        surnameLabel.text = store.Users[indexUser].surname
        imageUser.image = store.Users[indexUser].image
        imageUser.layer.cornerRadius = 25.0
        imageUser.clipsToBounds = true
        BarName.title = store.Users[indexUser].login
    }
    
    @IBAction func createNote(sender: AnyObject)
    {
        performSegueWithIdentifier("CreateNote", sender: sender)
    }
    
}

//MARK:- Настройка таблицы
extension PersonalPageController
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return store.Users[indexUser].Notes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellNote", forIndexPath: indexPath) as! NoteTableCell
        
        cell.labelNote.text = store.Users[indexUser].Notes[indexPath.row].title
        cell.imageNote.image = store.Users[indexUser].Notes[indexPath.row].image
        
        cell.imageNote.layer.cornerRadius = 25.0
        cell.imageNote.clipsToBounds = true
        
        return cell
    }
}

//MARK:- Взаимодействие с таблицей
extension PersonalPageController
{
    //Нажатие
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        indexNote = indexPath.row
        performSegueWithIdentifier("ShowNote", sender: nil)
    }
    
    //Свайп
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let deleteAction = UITableViewRowAction (style: .Default, title: "Удалить")
        {
            (actin, indexPath) -> Void in
            store.Users[self.indexUser].Notes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        deleteAction.backgroundColor = UIColor.blackColor()
        
        return [deleteAction]
    }
}


//MARK:- Переходы
extension PersonalPageController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let destin = segue.destinationViewController as! NoteController
        
        if segue.identifier == "ShowNote"
        {
            destin.indexNote = self.indexNote
            destin.indexUser = self.indexUser
        }
        
        if segue.identifier == "CreateNote"
        {
            destin.indexNote = -1
            destin.indexUser = self.indexUser
        }
    }
}











