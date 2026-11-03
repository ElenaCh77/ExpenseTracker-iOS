import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject private var viewModel = TransactionsViewModel()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(viewModel)
        }
    }
}
