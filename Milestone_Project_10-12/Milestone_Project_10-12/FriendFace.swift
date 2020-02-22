//
//  FriendFace.swift
//  Milestone_Project_10-12
//
//  Created by Matt Ridenhour on 2/14/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

class FriendFace: ObservableObject {
    @Published var items = [JSONUser]()
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init() {
        let request: NSFetchRequest = User.fetchRequest()
        guard let users = try? moc.fetch(request) else {
            return
        }
        if users.count == 0 {
            print("Calling API")
            fetchData()
        } else {
            print("Calling CoreData")
        }
    }
    
    private func fetchData() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let decodedUser = try decoder.decode([JSONUser].self, from: data)
                
                DispatchQueue.main.async {
                    for du in decodedUser {
                        let user = User(context: self.moc)
                        
                        user.id = du.id
                        user.isActive = du.isActive
                        user.name = du.name
                        user.age = Int16(du.age)
                        user.company = du.company
                        user.email = du.email
                        user.address = du.address
                        user.about = du.about
                        user.registered = du.registered
                        user.tags = du.tags
                        
                        for uf in du.friends {
                            let friend = Friend(context: self.moc)
                            
                            friend.id = uf.id
                            friend.name = uf.name
                            
                            user.addToFriends(friend)
                        }
                    }
                    try? self.moc.save()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    func findPerson(byId id: String) -> JSONUser? {
        if let person = items.first(where: { $0.id == id }) {
            return person
        }
        
        return items.first
    }
}
