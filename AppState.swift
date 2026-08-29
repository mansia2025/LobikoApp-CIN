import SwiftUI
import CoreLocation

enum UserRole: String, Codable, CaseIterable {
    case patient = "Patient"
    case medecin = "Médecin"
    case pharmacien = "Pharmacien"
    case livreur = "Livreur"
}

class AppState: ObservableObject {
    @Published var currentRole: UserRole? = nil
    @Published var isAuthenticated: Bool = false
}
