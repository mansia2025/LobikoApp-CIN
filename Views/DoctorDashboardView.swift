import SwiftUI

struct DoctorDashboardView: View {
    @EnvironmentObject var appState: AppState
    @State private var prescriptionCreated = false

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
                            prescriptionCreated = true
                        }
                        .padding(.top, 5)
                        .foregroundColor(.blue)
                    }
                    .padding(.vertical, 5)
                    if prescriptionCreated {
                        Label("E-ordonnance créée localement.", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                
                Section {
                    Button("Se déconnecter") {
                            appState.signOut()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Espace Médecin")
        }
    }
}
