import SwiftUI

struct PharmacistDashboardView: View {
    @EnvironmentObject var appState: AppState
    @State private var preparationComplete = false

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
                            if let order = appState.orders.first(where: { $0.status == .accepted }) {
                                appState.updateOrder(order, to: .prepared)
                            }
                            preparationComplete = true
                        }
                        .padding(.top, 5)
                        .foregroundColor(.blue)
                    }
                    .padding(.vertical, 5)
                    if preparationComplete {
                        Label("Colis préparé.", systemImage: "checkmark.circle.fill")
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
            .navigationTitle("Espace Pharmacien")
        }
    }
}
