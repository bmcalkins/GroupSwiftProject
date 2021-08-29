//
//  MusicListingTableViewCell.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/29/21.
//

import UIKit

class MusicListingTableViewCell: UITableViewCell {
    @IBOutlet var myAlbumNameLabel: UILabel!
    @IBOutlet var myPriceLabel: UILabel!
    
    static let identifier = "MusicListingTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MusicListingTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
