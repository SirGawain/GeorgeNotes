//
//  NoteTableCell.swift
//  GeorgeNotes
//
//  Created by george on 23/08/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class NoteTableCell: UITableViewCell
{

    @IBOutlet weak var imageNote: UIImageView!
    @IBOutlet weak var labelNote: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}
