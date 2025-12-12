import SwiftUI
import Alamofire


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

     func main() {
        Task {
            let manager = NetworkManager()
            
            do {
                let data = try await manager.fetchData(
                    from: "https://api.restful-api.dev/objects/7"
                )
                print("Fetched \(data.count) bytes")
            } catch {
                print("Error: \(error)")
            }
        }
        
        // Keep the program running
        RunLoop.main.run()
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "hammer.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            // Text("Hello, SwiftUI!")
            //     .font(.largeTitle)
            //     .fontWeight(.bold)
            
            Text("Built with Bazell")
                .font(.subheadline)
                .foregroundColor(.secondary)

            List(viewModel.users, id: \.id) { user in
                Text(user.name)
            }

            Button("Load Users") {
                viewModel.loadUsers()

                main()
            }
        }
        .padding()
    }
}