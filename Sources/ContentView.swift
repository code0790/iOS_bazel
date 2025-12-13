import SwiftUI
import Alamofire
import Screens
import CoreModels

public class NetworkManager {
    public init() {}
    
    public func fetchData(from url: String) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public func get<T: Decodable>(
        _ url: String,
        type: T.Type
    ) async throws -> T {
        let data = try await fetchData(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}


struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack(spacing: 20) {
                Image(systemName: "hammer.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                
                Text("Hello, SwiftUI!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Built with Bazell")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    List(viewModel.products, id: \.id) { product in
                        Button(product.name) {
                            viewModel.didSelect(prod: product)
                        }
                    }
                    
                }
                
                Button("Load Users") {
                    Task {
                        await viewModel.loadProducts()
                    }
                }
            }
            .padding()
            .navigationDestination(for: Product.self) { get in
                ScreenView(product: get)
            }
        }
    }
}
