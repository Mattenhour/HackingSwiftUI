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
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    var annotations: [MKPointAnnotation]
    
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
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        /// mapView can create a custom annotation view
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Placemark"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }
        
        /// calloutAccessoryControlTapped is call when a button is tapped
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let placemark = view.annotation as? MKPointAnnotation else { return }

            parent.selectedPlace = placemark
            parent.showingPlaceDetails = true
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
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), selectedPlace: .constant(MKPointAnnotation.example), showingPlaceDetails: .constant(false), annotations: [MKPointAnnotation.example])
    }
}
