//
//  ViewController.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var albums: [Album] = []
    
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
    
    func tableSetting() {
        tableView.dataSource = self
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
        
        cell.albumPrice.text = String(self.albums[indexPath.row].collectionPrice)
        
        fetchImage(url: self.albums[indexPath.row].artworkUrl100) { image in
            cell.albumImageView.image = image
        }
        
        return cell
    }
    
    
}


/*
 [X]1. Create MVC folders
 [X]2. Decode model in model file (swift)
 [X]3. Create custom table cell (cocoa touch)
    [X]- create static method to access identifier
    [X]- create outlets from nib file
 [X]4. Extend view controller with table settings
    [X]- configure table view source
    [X]- register nib with custom cell identifier
 [X]5. Extend view controller with UITableViewDataSourcePrefetching
    [X]- call fetchData
        [X]- fetchData invokes downloadData with completion escaping closure
            [X]- after data is downloaded, main dispatch queue reloads data
 []6. fetchImage function to find from or add to image cache
 []7. Create cache file (swift)
    []- create static instance with private init
    []- store data with NSCache class: NSString key(image url, UIImage object)
    []- create read and write functions
 []8. extend view controller with UITableViewDelegate
    []- add didSelectRowAt for add to cart or cancel
 []9. Create outlets to nav bar buttons
 */
