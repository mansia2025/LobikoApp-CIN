import SwiftUI

struct OrderView: View {
    @EnvironmentObject private var appState: AppState
    @State private var deliveryItem: String = ""
    @State private var deliveryAddress: String = ""
    @State private var validationMessage: String?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails de la course")) {
                    TextField("Ex: Médicaments, Colis urgent...", text: $deliveryItem)
                    TextField("Adresse de livraison à Kinshasa", text: $deliveryAddress, axis: .vertical)
                }

                if let validationMessage {
                    Section { Text(validationMessage).foregroundColor(.red) }
                }
                
                Section {
                    Button(action: {
                        submitOrder()
                    }) {
                        Text("Commander un livreur")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                    .listRowBackground(Color.blue)
                }
                
                if !appState.orders.isEmpty {
                    Section(header: Text("Mes commandes")) {
                        ForEach(appState.orders) { order in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(order.item).font(.headline)
                                Text(order.address).font(.subheadline).foregroundColor(.secondary)
                                Text(order.status.rawValue).font(.caption).foregroundColor(.orange)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Nouvelle Course")
        }
    }

    private func submitOrder() {
        let item = deliveryItem.trimmingCharacters(in: .whitespacesAndNewlines)
        let address = deliveryAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        guard item.count >= 3, address.count >= 5 else {
            validationMessage = "Indiquez le colis et une adresse de livraison complète."
            return
        }
        appState.createOrder(item: item, address: address)
        deliveryItem = ""
        deliveryAddress = ""
        validationMessage = nil
    }
}
