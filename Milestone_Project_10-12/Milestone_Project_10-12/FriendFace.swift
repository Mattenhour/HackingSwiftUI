//
//  FriendFace.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/14/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import Foundation

class FriendFace: ObservableObject {
    @Published var items = [User]()
    
    init() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedOrder = try? decoder.decode([User].self, from: data) {
                DispatchQueue.main.async {
                    self.items = decodedOrder
                }
                return
            }

        }.resume()
    }
    
}
