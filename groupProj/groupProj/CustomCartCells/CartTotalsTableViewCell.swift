//
//  cartTotalsTableViewCell.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/27/21.
//

import Foundation
import UIKit

class CartTotalsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cartQuantity: UILabel!
    @IBOutlet weak var priceTotal: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
       }
}
