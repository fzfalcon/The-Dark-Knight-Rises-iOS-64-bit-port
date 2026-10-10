import SwiftUI
import MetalKit

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                MetalRenderView()
                    .frame(height: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.white.opacity(0.2), lineWidth: 1)
                    }

                Text("THE DARK KNIGHT RISES")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)

                Text("Native iOS ARM64 Port")
                    .foregroundStyle(.gray)

                VStack(alignment: .leading, spacing: 10) {
                    status("iOS application", "Ready")
                    status("Metal renderer", "Initialized")
                    status("ARM32 game engine", "Not integrated")
                    status("Game assets", "Not loaded")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.white.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 12))

                Spacer()
            }
            .padding()
        }
        .preferredColorScheme(.dark)
    }

    private func status(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title).foregroundStyle(.white.opacity(0.8))
            Spacer()
            Text(value).foregroundStyle(.secondary)
        }
        .font(.footnote)
    }
}

struct MetalRenderView: UIViewRepresentable {
    func makeUIView(context: Context) -> MTKView {
        let view = MTKView()
        view.device = MTLCreateSystemDefaultDevice()
        view.clearColor = MTLClearColor(
            red: 0.025, green: 0.035, blue: 0.06, alpha: 1
        )
        view.colorPixelFormat = .bgra8Unorm
        view.isPaused = true
        view.enableSetNeedsDisplay = true
        view.delegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: MTKView, context: Context) {}

    func makeCoordinator() -> Renderer {
        Renderer()
    }

    final class Renderer: NSObject, MTKViewDelegate {
        func draw(in view: MTKView) {}

        func mtkView(
            _ view: MTKView,
            drawableSizeWillChange size: CGSize
        ) {}
    }
}
