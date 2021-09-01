//
//  CartViewTableViewController.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/26/21.
//

import UIKit

class CartViewTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet var tableView: UITableView!
    
    weak var delegate: CartDelegate?
    var cartItems: [Album] = []
    func setCart(_ cart: [Album]) {
        cartItems = cart
    }
    
    @objc func buyAction(sender: UIBarButtonItem){
        emptyCart(cart: cartItems)
    }
    
    func emptyCart(cart: [Album]) {
        delegate?.clearCart(albums: cartItems)
        self.cartItems.removeAll()
        self.tableView.reloadData()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Cart"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Buy", style: .plain, target: self, action: #selector(buyAction))
        
        tableView.register(MusicListingTableViewCell.nib(), forCellReuseIdentifier: MusicListingTableViewCell.identifier)
        
        
        tableView.register(CartTotalsTableViewCell.nib(), forCellReuseIdentifier:  CartTotalsTableViewCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
       
    }

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
            sum += Double(ele.collectionPrice)
        }
        return sum
    }
}
    

