//
//  CartViewTableViewController.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/26/21.
//

import UIKit

class CartViewTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet var tableView: UITableView!
    
    var cartItems: [Album] = []
    func setCart(_ cart: [Album]) {
        cartItems = cart
    }
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
       
       
        
        tableView.register(MusicListingTableViewCell.nib(), forCellReuseIdentifier: MusicListingTableViewCell.identifier)
        
        
        tableView.register(CartTotalsTableViewCell.nib(), forCellReuseIdentifier:  CartTotalsTableViewCell.identifier)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
       
    }
  
    @IBAction func buyAction(_ sender: Any) {
        cartItems.removeAll()
    }
    
    
    
//
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
        // loop for save changes
    }
    /*
     @IBAction func buyAction(cart: [Album]_ sender: Any) {
         
     }
     **/
    
    
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row <= cartItems.count - 1 {
            guard let myCell = tableView.dequeueReusableCell(withIdentifier: MusicListingTableViewCell.identifier) as? MusicListingTableViewCell else { fatalError() }
            myCell.albumName.text = self.cartItems[indexPath.row].collectionName
          
          
            myCell.albumPrice.text = "$" + String(self.cartItems[indexPath.row].collectionPrice)
           return myCell
        }
        else if indexPath.row == cartItems.count && cartItems.count > 0 {

            guard let myCell = tableView.dequeueReusableCell(withIdentifier: CartTotalsTableViewCell.identifier) as? CartTotalsTableViewCell else { fatalError() }
            myCell.myQuantityLabel.text = "Num Items: " + String(cartItems.count)
            myCell.myPriceTotalLabel.text = "Price: $" + String(calculateCartTotal() )

            cell = myCell
        }

        
     return cell
        
    }
    
    func calculateCartTotal() -> Double {
        var sum = 0.0
        for ele in cartItems {
            sum += Double(ele.collectionPrice) * Double(cartItems.count + 1)

        }
        return sum
    }

  
}
    

