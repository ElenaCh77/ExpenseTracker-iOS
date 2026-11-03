import SwiftUI

struct WelcomeView: View {
    @State private var hasStarted = false

    var body: some View {
        if hasStarted {
            ContentView()
        } else {
            ZStack {
                Color(red: 0.94, green: 0.97, blue: 0.95).ignoresSafeArea()
                VStack(spacing: 24) {
                    Spacer()
                    Image(systemName: "chart.pie.fill")
                        .font(.system(size: 90))
                        .foregroundStyle(.green)
                    Text("Expense Tracker")
                        .font(.largeTitle.bold())
                    Text("Keep track of your income and expenses in one place.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 32)
                    Spacer()
                    Button { hasStarted = true } label: {
                        Text("Get Started")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 32)
                }
            }
        }
    }
}
