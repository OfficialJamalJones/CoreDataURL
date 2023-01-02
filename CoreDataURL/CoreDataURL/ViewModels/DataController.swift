//
//  DataController.swift
//  Core_Data
//
//  Created by Consultant on 1/2/23.
//

import CoreData
import Foundation

class DataController:ObservableObject {
    let  container = NSPersistentContainer(name: "DataModel")
    
    init() {
        self.container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func saveSong(song: Song) {
        print("Saved: \(song)")
    }
}
