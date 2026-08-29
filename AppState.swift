import Foundation
import Combine

enum UserRole: String, Codable, CaseIterable, Identifiable {
    case patient = "Patient"
    case medecin = "Médecin"
    case pharmacien = "Pharmacien"
    case livreur = "Livreur"

    var id: String { rawValue }
}

struct DeliveryOrder: Identifiable, Codable, Equatable {
    enum Status: String, Codable { case searching = "Recherche d’un livreur", accepted = "Course acceptée", prepared = "Colis préparé" }
    let id: UUID
    let item: String
    let address: String
    var status: Status
    let createdAt: Date
}

@MainActor
final class AppState: ObservableObject {
    @Published private(set) var currentRole: UserRole?
    @Published private(set) var phoneNumber: String?
    @Published private(set) var orders: [DeliveryOrder]
    var isAuthenticated: Bool { currentRole != nil }

    private let roleKey = "currentUserRole"
    private let phoneKey = "currentUserPhone"
    private let ordersKey = "deliveryOrders"

    init(defaults: UserDefaults = .standard) {
        currentRole = defaults.string(forKey: roleKey).flatMap(UserRole.init(rawValue:))
        phoneNumber = defaults.string(forKey: phoneKey)
        let data = defaults.data(forKey: ordersKey)
        orders = (try? data.flatMap { try JSONDecoder().decode([DeliveryOrder].self, from: $0) }) ?? []
    }

    func signIn(role: UserRole, phoneNumber: String) {
        currentRole = role
        self.phoneNumber = phoneNumber
        UserDefaults.standard.set(role.rawValue, forKey: roleKey)
        UserDefaults.standard.set(phoneNumber, forKey: phoneKey)
    }

    func signOut() {
        currentRole = nil
        phoneNumber = nil
        UserDefaults.standard.removeObject(forKey: roleKey)
        UserDefaults.standard.removeObject(forKey: phoneKey)
    }

    func createOrder(item: String, address: String) {
        orders.insert(DeliveryOrder(id: UUID(), item: item, address: address, status: .searching, createdAt: .now), at: 0)
        saveOrders()
    }

    func updateOrder(_ order: DeliveryOrder, to status: DeliveryOrder.Status) {
        guard let index = orders.firstIndex(of: order) else { return }
        orders[index].status = status
        saveOrders()
    }

    private func saveOrders() {
        guard let data = try? JSONEncoder().encode(orders) else { return }
        UserDefaults.standard.set(data, forKey: ordersKey)
    }
}
