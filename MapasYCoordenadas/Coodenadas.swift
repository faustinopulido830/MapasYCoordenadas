//
//  Coodenadas.swift
//  MapasYCoordenadas
//
//  Created by Faustino Pulido Sarmiento on 13/05/21.
//

import UIKit
import MapKit
import CoreLocation
class Coodenadas: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var mostrarCoordenadas: UILabel!

    var manager = CLLocationManager()
    var latitud : CLLocationDegrees!
    var longitud : CLLocationDegrees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.latitud = location.coordinate.latitude
            self.longitud = location.coordinate.longitude
        }
    }
    
    @IBAction func obtener(_ sender: UIButton) {
        mostrarCoordenadas.text = "lat: \(latitud!), long: \(longitud!)"
        
        let localizacion = CLLocationCoordinate2DMake(latitud, longitud)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: localizacion, span: span)
        mapa.setRegion(region, animated: true)
        mapa.showsUserLocation = true
    }
    
}
  
