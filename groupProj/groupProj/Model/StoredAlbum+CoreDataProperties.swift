//
//  StoredAlbum+CoreDataProperties.swift
//  groupProj
//
//  Created by jason hillegass on 8/30/21.
//
//

import Foundation
import CoreData


extension StoredAlbum {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoredAlbum> {
        return NSFetchRequest<StoredAlbum>(entityName: "StoredAlbum")
    }

    @NSManaged public var name: String?

}

extension StoredAlbum : Identifiable {

}
