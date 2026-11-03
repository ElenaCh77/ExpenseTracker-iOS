import Foundation

final class TransactionsViewModel: ObservableObject {
    @Published private(set) var transactions: [Transaction] = [] {
        didSet { saveTransactions() }
    }

    private let storageKey = "expense_tracker_transactions_v1"

    init() { loadTransactions() }

    func addTransaction(amount: Double, category: String, date: Date, type: TransactionType) {
        guard amount > 0, amount.isFinite else { return }
        transactions.append(Transaction(amount: amount, category: category, date: date, type: type))
    }

    func removeTransaction(_ transaction: Transaction) {
        transactions.removeAll { $0.id == transaction.id }
    }

    func removeTransaction(transaction: Transaction) {
        removeTransaction(transaction)
    }

    func transactions(for month: Int, year: Int) -> [Transaction] {
        transactions.filter {
            let components = Calendar.current.dateComponents([.month, .year], from: $0.date)
            return components.month == month && components.year == year
        }.sorted { $0.date > $1.date }
    }

    func getMonthlySummary(for month: Int, year: Int) -> (income: Double, expenses: Double) {
        let filtered = transactions(for: month, year: year)
        let income = filtered.filter { $0.type == .income }.reduce(0) { $0 + $1.amount }
        let expenses = filtered.filter { $0.type == .expense }.reduce(0) { $0 + $1.amount }
        return (income, expenses)
    }

    private func saveTransactions() {
        guard let data = try? JSONEncoder().encode(transactions) else { return }
        UserDefaults.standard.set(data, forKey: storageKey)
    }

    private func loadTransactions() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let saved = try? JSONDecoder().decode([Transaction].self, from: data) else { return }
        transactions = saved
    }
}
