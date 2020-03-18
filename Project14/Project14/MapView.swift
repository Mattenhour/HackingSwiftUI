//
//  MapView.swift
//  Project14
//
//  Created by Matt Ridenhour on 3/17/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    
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
        
        /// mapViewDidChangeVisibleRegion called whenever the map view changes its visible region, which means when it moves, zooms, or rotates
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        /// mapView can create a custom annotation view
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
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
        
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Capital of England"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
