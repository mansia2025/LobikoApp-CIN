import SwiftUI

struct PatientDashboardView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView {
            // Onglet 1 : Carte et Accès rapide aux infrastructures de santé
            NavigationView {
                List {
                    Section(header: Text("Trouver une infrastructure à Kinshasa")) {
                        
                        // Bouton Pharmacies
                        Button(action: {
                            openMapSearch(query: "pharmacie")
                        }) {
                            HStack {
                                Image(systemName: "cross.case.fill")
                                    .foregroundColor(.green)
                                    .frame(width: 30)
                                Text("Pharmacies de garde")
                                    .foregroundColor(.primary)
                            }
                            .padding(.vertical, 4)
                        }
                        
                        // Bouton Hôpitaux
                        Button(action: {
                            openMapSearch(query: "hôpital")
                        }) {
                            HStack {
                                Image(systemName: "cross.fill")
                                    .foregroundColor(.red)
                                    .frame(width: 30)
                                Text("Hôpitaux et Cliniques")
                                    .foregroundColor(.primary)
                            }
                            .padding(.vertical, 4)
                        }
                        
                        // Bouton Dispensaires
                        Button(action: {
                            openMapSearch(query: "dispensaire")
                        }) {
                            HStack {
                                Image(systemName: "heart.text.square.fill")
                                    .foregroundColor(.blue)
                                    .frame(width: 30)
                                Text("Dispensaires et Centres de santé")
                                    .foregroundColor(.primary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
                .navigationTitle("Carte & Santé")
            }
            .tabItem {
                Label("Santé", systemImage: "map.fill")
            }
            
            // Onglet 2 : Passer une commande
            OrderView()
                .tabItem {
                    Label("Commander", systemImage: "shippingbox.fill")
                }
            
            // Onglet 3 : Profil
            NavigationView {
                List {
                    Section(header: Text("Mon Compte")) {
                        Text("Rôle : \(appState.currentRole?.rawValue ?? "")")
                        Button("Se déconnecter") {
                            appState.isAuthenticated = false
                            appState.currentRole = nil
                        }
                        .foregroundColor(.red)
                    }
                }
                .navigationTitle("Mon Profil")
            }
            .tabItem {
                Label("Profil", systemImage: "person.fill")
            }
        }
    }
    
    // Fonction universelle pour lancer l'application de cartographie avec filtre
    func openMapSearch(query: String) {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let url = URL(string: "http://maps.google.com/maps?q=\(encodedQuery)") {
            UIApplication.shared.open(url)
        }
    }
}
