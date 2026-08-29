import SwiftUI

@main
struct LobikoApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            if appState.isAuthenticated {
                // Affiche l'écran correspondant au rôle sélectionné
                Group {
                    switch appState.currentRole {
                    case .patient:
                        PatientDashboardView()
                    case .medecin:
                        DoctorDashboardView()
                    case .pharmacien:
                        PharmacistDashboardView()
                    case .livreur:
                        DeliveryDashboardView()
                    case .none:
                        OnboardingView()
                    }
                }
                .environmentObject(appState)
            } else {
                OnboardingView()
                    .environmentObject(appState)
            }
        }
    }
}
