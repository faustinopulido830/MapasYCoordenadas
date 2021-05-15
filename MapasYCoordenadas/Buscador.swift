//
//  Buscador.swift
//  MapasYCoordenadas
//
//  Created by Faustino Pulido Sarmiento on 14/05/21.
//

import UIKit
import MapKit
class Buscador: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var buscar: UISearchBar!
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscar.delegate = self
       
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        buscar.resignFirstResponder()
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(buscar.text!) { (places:[CLPlacemark]?, error:Error?) in
            if error == nil {
                let place = places?.first
                let anotacion = MKPointAnnotation()
                anotacion.coordinate = (place?.location?.coordinate)!
                anotacion.title = self.buscar.text
                
                let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                let region = MKCoordinateRegion(center: anotacion.coordinate, span: span)
                self.mapa.setRegion(region, animated: true)
                
                self.mapa.addAnnotation(anotacion)
                self.mapa.selectAnnotation(anotacion, animated: true)
                
            } else {
                print("Error al encontrar el mapa")
            }
        }
    }
    
    
    
}
