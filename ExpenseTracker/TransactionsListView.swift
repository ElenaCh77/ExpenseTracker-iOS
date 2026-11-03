import SwiftUI

struct TransactionsListView: View {
    @EnvironmentObject private var viewModel: TransactionsViewModel
    @State private var selectedDate = Date()

    private var month: Int { Calendar.current.component(.month, from: selectedDate) }
    private var year: Int { Calendar.current.component(.year, from: selectedDate) }
    private var filtered: [Transaction] { viewModel.transactions(for: month, year: year) }

    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Select month", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .padding(.horizontal)
                if filtered.isEmpty {
                    ContentUnavailableView("No transactions", systemImage: "tray", description: Text("Add a transaction to see it here."))
                } else {
                    List {
                        ForEach(filtered) { transaction in
                            HStack(spacing: 12) {
                                Image(systemName: Category.icon(for: transaction.category, type: transaction.type))
                                    .foregroundStyle(.green)
                                    .frame(width: 30)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(transaction.category).font(.headline)
                                    Text(transaction.date, style: .date)
                                        .font(.caption).foregroundStyle(.secondary)
                                }
                                Spacer()
                                Text(transaction.amount, format: .currency(code: "USD"))
                                    .foregroundStyle(transaction.type == .income ? .green : .primary)
                                    .fontWeight(.semibold)
                                Button(role: .destructive) {
                                    viewModel.removeTransaction(transaction)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .buttonStyle(.borderless)
                                .accessibilityLabel("Delete transaction")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Transactions")
        }
    }
}
