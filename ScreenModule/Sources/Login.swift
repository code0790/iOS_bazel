import SwiftUI

public struct ScreenView: View {
    public init() {}  // public init so other modules can construct it

    public var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to ScreenView")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("This is a reusable SwiftUI screen module.")
                .foregroundColor(.secondary)

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