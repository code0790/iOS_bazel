import SwiftUI
import CoreModels

public struct ScreenView: View {
    
    var product: Product
    
    public init(product: Product) {
        self.product = product
    }

    public var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to ScreenView")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(product.name)
                .foregroundColor(.secondary)
                .font(.headline)

            Button(action: {
                print("Button tapped!")
            }) {
                Text("Tap Me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
