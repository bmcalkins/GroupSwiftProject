//
//  CartViewTableViewController.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/26/21.
//

import UIKit

class CartViewTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CartDelegate {
    var cartResults: [Album] = []
    
    func appendToCartArray(album: Album) {
        <#code#>
    }
    
    var albums: [Album] = []
    
    func displayListOfAlbums(albums: [Album]) {
        ///display list of albums here
    }
    
 
    
    var cartItems: [Album] = []
    func setCart(_ cart: [Album]) {
        cartItems = cart
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        table.register(MusicListingTableViewCell.nib(), forCellReuseIdentifier: MusicListingTableViewCell.identifier )
        
        table.register(CartTotalsTableViewCell.nib(), forCellReuseIdentifier:  CartTotalsTableViewCell.identifier
                       )
        
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
  
    @IBAction func buyAction(_ sender: Any) {
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
        return cartItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == cartItems.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: MusicListingTableViewCell.identifier, for: indexPath)
                //cell.configure()
            return cell
        }
        else if indexPath.row == 1 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cartTotalsCell")
            //set the data
            return cell
        }
        return UITableViewCell()
    }

  
}
    

