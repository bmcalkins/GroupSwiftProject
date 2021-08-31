//
//  ViewController.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cartButton: UIBarButtonItem!
    
    ///outlet created for album view controller
    
//    @IBAction func goToMyAlbums(_ sender: Any) {
//    }
    
    @IBAction func goToCart(_ sender: Any) {
        navigateToCart()
    }
    
    var albums: [Album] = []
    var cart: [Album] = []
    
    func appendToCartArray( album: String) {
        for ele in albums {
            if ele.collectionName == album {
                cart.append(ele)
                return
            }
        }
        
    }
    
    let albumString = "https://itunes.apple.com/search?term=taylor&entity=album"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetting()
        downloadData()
    }
    
    func downloadData() {
        fetchData() { albums in
            self.albums = albums
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func updateCartImage() {
        let imageStr = cart.count > 0 ? "cart.fill" : "cart"
        cartButton.image = UIImage(systemName: imageStr)
    }
    
    func tableSetting() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: AlbumCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: AlbumCell.identifier)
    }
    
    func fetchData(closure: @escaping ([Album]) -> Void) {
        guard let url = URL(string: albumString) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else { return }
            if let albumsDecoded = try? JSONDecoder().decode(AlbumList.self, from: data) {
                closure(albumsDecoded.results)
            }
        }.resume()
    }
    
    func fetchImage(url: String, closure: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else { fatalError() }
        URLSession.shared.dataTask(with: url) {data, response, error in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    closure(image)
                }
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.identifier) as? AlbumCell else { fatalError() }
        
        cell.albumName.text = self.albums[indexPath.row].collectionName
        
        cell.albumPrice.text = "$" + String(self.albums[indexPath.row].collectionPrice)
        
        fetchImage(url: self.albums[indexPath.row].artworkUrl100) { image in
            cell.albumImageView.image = image
        }
        
        return cell
    }
    
    func navigateToCart() {
        let cartSB = UIStoryboard(name: "Cart", bundle: nil)
        if let cartVC = cartSB.instantiateViewController(identifier: "CartViewTableViewController") as? CartViewTableViewController {
            cartVC.setCart(cart)
            navigationController?.pushViewController(cartVC, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate {
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
        guard let cell = tableView.cellForRow(at: indexPath) as? AlbumCell else {return}
            
            alert.addAction(UIAlertAction(title: "Add To Cart", style: .default, handler: {(alert:UIAlertAction!) in self.appendToCartArray(album: cell.albumName.text ?? "")
                updateCartImage()
            }
                                      ))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
        }
}

protocol CartDelegate {
    var cartResults: [Album] {get}
    func appendToCartArray( album: Album)
}



