import SwiftUI

struct PharmacistDashboardView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Commandes de médicaments reçues")) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("💊 Ordonnance #402")
                            .font(.headline)
                        Text("📍 Quartier : Gombe, Kinshasa")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Button("Valider et préparer le colis") {
                            // Action de préparation
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
            .navigationTitle("Espace Pharmacien")
        }
    }
}
