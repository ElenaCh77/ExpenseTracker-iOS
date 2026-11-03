import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TransactionsListView()
                .tabItem { Label("Transactions", systemImage: "list.bullet.rectangle") }
            SummaryView()
                .tabItem { Label("Summary", systemImage: "chart.pie") }
            AddTransactionView()
                .tabItem { Label("Add", systemImage: "plus.circle") }
        }
        .tint(.green)
    }
}
