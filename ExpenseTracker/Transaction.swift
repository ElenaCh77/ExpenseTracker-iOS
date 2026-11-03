import Foundation

enum TransactionType: String, Codable, CaseIterable, Identifiable {
    case income = "Income"
    case expense = "Expense"
    var id: String { rawValue }
}

struct Transaction: Identifiable, Codable {
    var id: UUID = UUID()
    var amount: Double
    var category: String
    var date: Date
    var type: TransactionType
}
