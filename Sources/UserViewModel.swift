import SwiftUI

// ViewModel
class UserViewModel: ObservableObject {
    @Published var users: [User] = []

    func loadUsers() {
        // Simulated data fetch
        users = [
            User(id: 1, name: "Navpreet"),
            User(id: 2, name: "Alex")
        ]
    }
}