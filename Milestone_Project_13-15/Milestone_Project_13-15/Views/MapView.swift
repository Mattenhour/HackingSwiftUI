//
//  MapView.swift
//  Milestone_Project_13-15
//
//  Created by Matt Ridenhour on 4/11/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    let location: CLLocationCoordinate2D
    
    class Coordinator: NSObject, MKMapViewDelegate {
        /*
         MapKit automatically examines our Coordinator class to see which one of those notifications
         we want to be told about. It does this using function signatures: if it finds a method with
         a precise name and parameter list, it will call that.
         */
        
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
    
    /// makeCoordinator sends back a configured instance of our Coordinator
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }
    
    /*
     Wherever Swift sees 'Context' in code it will consider it the same as
     UIViewRepresentableContext<Self>, where Self is whatever type we’re working with.
     
     In practical terms, this means we can just write Context rather than
     UIViewRepresentableContext<MapView>, and they mean exactly the same thing.
     */
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Add pin on map
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
        
        mapView.setCenter(location, animated: true)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        // TODO: Finish the map
    }
    
    
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
