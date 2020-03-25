//
//  MKPointAnnotation-ObservableObject
//  Project14
//
//  Created by Matt Ridenhour on 3/24/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        set {
            subtitle = newValue
        }
    }
}
