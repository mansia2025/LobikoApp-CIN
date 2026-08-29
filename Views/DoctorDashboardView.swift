import SwiftUI

struct DoctorDashboardView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Consultations en attente")) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("👤 Patient : Jean-Paul Kabeya")
                            .font(.headline)
                        Text("📋 Motif : Suivi ordonnance & renouvellement")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Button("Établir une e-ordonnance") {
                            // Action pour prescrire
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
            .navigationTitle("Espace Médecin")
        }
    }
}
