//
//  SavedAlbumsTableViewController.swift
//  groupProj
//
//  Created by jason hillegass on 8/30/21.
//

import UIKit
import CoreData
import Foundation

class SavedAlbumsTableViewController: UITableViewController{
    
    
// Mark: table functions
    ///context as reference to persistent container, arrays for items from cart and a reference to stored items
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var albumsTransferred: [Album] = []
    private var albumsStored = [StoredAlbum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateAlbumList(from: albumsTransferred) // update storage with purchased items
        
        getAllAlbums() //fetch items from storage

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return albumsStored.count
    }
    
    
    /*func transformToSaved(album: Album)
    {
        
    }*/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let selectedCell = albumsStored[indexPath.row]
        cell.textLabel?.text = selectedCell.name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: -----Core Data-----
    ///fills album stored array from persistent container
    func getAllAlbums()
    {
        do{
            albumsStored = try context.fetch(StoredAlbum.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch
        {
            print("Error retrieving")
        }
    }
    
    func createAlbum(name: String)
    {
        let newAlbum = StoredAlbum(context: context)
        newAlbum.name = name
        
        do
        {
            try context.save()
        }
        catch
        {
            print("Error creating")
        }
    }
    
    /*func updateAlbumList(from cart: [Album])
    {
        for item in cart{
            createAlbum(name: item.collectionName)
        }
    }*/
}
