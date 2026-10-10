import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "shield.lefthalf.filled")
                    .font(.system(size: 56))
                    .foregroundStyle(.white)

                Text("THE DARK KNIGHT RISES")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)

                Text("iOS ARM64 Port")
                    .foregroundStyle(.gray)

                Text("Development build — game engine not integrated")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}
