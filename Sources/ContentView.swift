import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "hammer.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Built with Bazel")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}