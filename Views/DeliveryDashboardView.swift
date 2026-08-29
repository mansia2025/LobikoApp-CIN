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
                            Text("📦 Colis : \(appState.orders.first?.item ?? "Aucune course disponible")")
                                .font(.headline)
                            Text("📍 Destination : \(appState.orders.first?.address ?? "Aucune destination")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Button("Accepter la course") {
                                if let order = appState.orders.first(where: { $0.status == .searching }) {
                                    appState.updateOrder(order, to: .accepted)
                                }
                            }
                            .disabled(!appState.orders.contains(where: { $0.status == .searching }))
                            .padding(.top, 5)
                            .foregroundColor(.blue)
                        }
                        .padding(.vertical, 5)
                    }
                    
                    Section {
                        Button("Se déconnecter") {
                            appState.signOut()
                        }
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Espace Livreur")
            .onAppear { locationManager.requestLocation() }
        }
    }
}
