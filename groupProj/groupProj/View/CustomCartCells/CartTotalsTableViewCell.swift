//
//  CartTotalsTableViewCell.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/29/21.
//

import UIKit

class CartTotalsTableViewCell: UITableViewCell {
    
    @IBOutlet var myQuantityLabel: UILabel!
    @IBOutlet var myPriceTotalLabel: UILabel!
    
    static let identifier = "CartTotalsTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "CartTotalsTableViewCell", bundle: nil)
    }
    
    public func configure()
    {
        
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
