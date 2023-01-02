//
//  ContentView.swift
//  CoreDataURL
//
//  Created by Consultant on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var songs: FetchedResults<Song>
    @State private var results = [Result]()
    
    var body: some View {
        List(songs, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName ?? "Track  Name")
                    .font(.headline)
            }
        }
        .task {
            await self.loadData()
        }
    }
    
    func loadData() async {
        print("Loading...")
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                //let dataController = DataController()
                let results = decodedResponse.results
                //print("Results: \(results)")
                for result in results {
                    let song = Song(context: moc)
                    song.id = UUID()
                    song.collectionName = result.collectionName
                    song.trackName = result.trackName
                    song.trackId = Int64(result.trackId)
                    print("Song: \(song)")
                    try? moc.save()
                }
                //self.results = decodedResponse.results
            }
        } catch {
            print("Invalid Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
