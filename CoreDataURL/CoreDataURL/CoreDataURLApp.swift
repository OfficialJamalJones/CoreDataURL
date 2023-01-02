//
//  CoreDataURLApp.swift
//  CoreDataURL
//
//  Created by Consultant on 1/2/23.
//

import SwiftUI

@main
struct CoreDataURLApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
