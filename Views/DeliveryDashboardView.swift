import SwiftUI
import MapKit

struct DeliveryDashboardView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                // Zone carte pour le livreur
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                    .frame(height: 300)
                    .cornerRadius(12)
                    .padding()
                
                List {
                    Section(header: Text("Courses disponibles à proximité")) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("📦 Colis : Urgence Médicale")
                                .font(.headline)
                            Text("📍 Destination : Gombe, Kinshasa")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Button("Accepter la course") {
                                // Action d'acceptation
                            }
                            .padding(.top, 5)
                            .foregroundColor(.blue)
                        }
                        .padding(.vertical, 5)
                    }
                    
                    Section {
                        Button("Se déconnecter") {
                            appState.isAuthenticated = false
                            appState.currentRole = nil
                        }
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Espace Livreur")
        }
    }
}
