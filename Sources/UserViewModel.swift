import SwiftUI
import CoreModels

// ViewModel
class UserViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var path = NavigationPath()

    func loadProducts() async {
        do {
            let manager = NetworkManager()
            products = try await manager.get("https://api.restful-api.dev/objects",
                                             type: [Product].self)
        } catch {
            print(error)
        }
    }
    
    func didSelect(prod: Product) {
        print("Selected: \(prod)")
        path.append(prod)
    }
}
