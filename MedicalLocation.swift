import Foundation
import CoreLocation
import MapKit

struct MedicalLocation: Identifiable {
    let id = UUID()
    let name: String
    let type: String // "Pharmacie", "Hôpital", "Dispensaire"
    let coordinate: CLLocationCoordinate2D
    let address: String
}
