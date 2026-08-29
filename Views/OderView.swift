import SwiftUI

struct OrderView: View {
    @State private var deliveryItem: String = ""
    @State private var deliveryAddress: String = ""
    @State private var orderSubmitted: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails de la course")) {
                    TextField("Ex: Médicaments, Colis urgent...", text: $deliveryItem)
                    TextField("Adresse de livraison à Kinshasa", text: $deliveryAddress)
                }
                
                Section {
                    Button(action: {
                        if !deliveryItem.isEmpty && !deliveryAddress.isEmpty {
                            orderSubmitted = true
                        }
                    }) {
                        Text("Commander un livreur")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                    .listRowBackground(Color.blue)
                }
                
                if orderSubmitted {
                    Section(header: Text("Statut")) {
                        HStack {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.orange)
                            Text("Recherche d'un livreur partenaire...")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Nouvelle Course")
        }
    }
}
