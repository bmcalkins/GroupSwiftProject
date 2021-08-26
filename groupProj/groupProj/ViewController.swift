//
//  ViewController.swift
//  groupProj
//
//  Created by Bradley Calkins on 8/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let albums = "https://itunes.apple.com/search?term=taylor&entity=album"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetting()
    }
    
    func tableSetting() {
        tableView.dataSource = self
        let nib = UINib(nibName: AlbumCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: AlbumCell.identifier)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.identifier) as? AlbumCell else { fatalError() }
        
        return cell
    }
    
    
}


/*
 []1. Create MVC folders
 []2. Decode model in model file (swift)
 []3. Create custom table cell (cocoa touch)
    []- create static method to access identifier
    []- create outlets from nib file
 []4. Extend view controller with table settings
    []- configure table view source
    []- register nib with custom cell identifier
 []5. Extend view controller with UITableViewDataSourcePrefetching
    []- call fetchData
        []- fetchData invokes downloadData with completion escaping closure
            []- after data is downloaded, main dispatch queue reloads data
 []6. Create cache file (swift)
    []- create static instance with private init
    []- store data with NSCache class: NSString key(image url, UIImage object)
    []- create read and write functions
 []7. fetchImage function to find from or add to image cache
 []8. extend view controller with UITableViewDelegate
    []- add didSelectRowAt to navigate to details view
 []9. Create outlets tonav bar buttons
 */
