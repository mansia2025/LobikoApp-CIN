import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedRole: UserRole = .patient
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Spacer()
                
                // En-tête / Logo
                VStack(spacing: 12) {
                    Image(systemName: "cross.case.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.blue)
                    
                    Text("Lobiko App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Votre santé, vos médicaments et vos livraisons médicales à Kinshasa.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                }
                
                // Champ de saisie du numéro de téléphone
                VStack(alignment: .leading, spacing: 8) {
                    Text("Numéro de téléphone")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    TextField("Ex: +243 812 345 678", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                
                // Sélection du profil / Rôle
                VStack(alignment: .leading, spacing: 8) {
                    Text("Je suis un(e)...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Picker("Rôle", selection: $selectedRole) {
                        Text("Patient").tag(UserRole.patient)
                        Text("Médecin").tag(UserRole.medecin)
                        Text("Pharmacien").tag(UserRole.pharmacien)
                        Text("Livreur").tag(UserRole.livreur)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Bouton de validation pour entrer dans l'app
                Button(action: {
                    // Valide l'authentification et applique le rôle choisi
                    appState.currentRole = selectedRole
                    appState.isAuthenticated = true
                }) {
                    Text("Commencer")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
            .navigationBarHidden(true)
        }
    }
}
