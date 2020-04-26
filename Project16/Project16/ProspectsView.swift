//
//  ProspectsView.swift
//  Project16
//
//  Created by Matt Ridenhour on 4/20/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import UserNotifications
import CodeScanner
import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    
    @State private var isShowingScanner = false
    @State private var isShowingSortSheet = false
    @State private var isSortingByName = true
    
    let filter: FilterType
    
    /// computed properties
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    var sortedProspects: [Prospect] {
        if isSortingByName {
            // By name
            return filteredProspects.sorted(by: { $0.name < $1.name })
        } else {
            // By most recent
            return filteredProspects.reversed()
        }
    }
    /// end of computed properties
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        // if in “Everyone” tab and prospect is contacted
                        if self.filter == .none && prospect.isContacted {
                            Image(systemName: "checkmark.circle")
                        }
                    }
                    .contextMenu { // allows for popup when prospect item is longed pressed
                        Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted") {
                            self.prospects.toggle(prospect)
                        }
                        
                        if !prospect.isContacted {
                            Button("Remind Me") {
                                self.addNotification(for: prospect)
                            }
                        }
                    }
                }
            }
                .navigationBarTitle(title)
                
                .navigationBarItems(leading:
                    Button(action: {
                        self.isShowingSortSheet = true
                }) {
                    Image(systemName: "arrow.up.arrow.down")
                    Text("Sort")
                    
                },trailing: Button(action: {
                    self.isShowingScanner = true
                    
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                })
                
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan)
                }
            
                .actionSheet(isPresented: $isShowingSortSheet) {
                    ActionSheet(title: Text("Sorting"), message: Text("Select sorting options"), buttons: [
                        .default(Text("Name")) { self.isSortingByName = true },
                        .default(Text("Most recent")) { self.isSortingByName = false },
                        .cancel()
                    ])
                }
        }
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            self.prospects.add(person)
            
        case .failure(let error):
            print("Scanning failed")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default

//            var dateComponents = DateComponents()
//            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
