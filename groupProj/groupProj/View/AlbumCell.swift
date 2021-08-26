//
//  AlbumCell.swift
//  groupProj
//
//  Created by Julie Connors on 8/26/21.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    static let identifier = String(describing: AlbumCell.self)

    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumPrice: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albumName.text = "Name"
        albumPrice.text = "Price"
    }
}
