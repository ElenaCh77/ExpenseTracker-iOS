import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject private var viewModel: TransactionsViewModel
    @State private var type: TransactionType = .expense
    @State private var amountText = ""
    @State private var category: Category?
    @State private var date = Date()
    @State private var showSaved = false

    private var availableCategories: [Category] { Category.sampleCategories(for: type) }
    private var amount: Double? {
        Double(amountText.replacingOccurrences(of: ",", with: "."))
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Transaction type") {
                    Picker("Type", selection: $type) {
                        ForEach(TransactionType.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: type) { _ in category = nil }
                }
                Section("Details") {
                    TextField("Amount", text: $amountText)
                        .keyboardType(.decimalPad)
                    Picker("Category", selection: $category) {
                        Text("Choose a category").tag(nil as Category?)
                        ForEach(availableCategories) { option in
                            Label(option.name, systemImage: option.icon)
                                .tag(Optional(option))
                        }
                    }
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
                Section {
                    Button("Save Transaction") { save() }
                        .frame(maxWidth: .infinity)
                        .disabled(category == nil || amount == nil || (amount ?? 0) <= 0 || !(amount?.isFinite ?? false))
                }
            }
            .navigationTitle("Add Transaction")
            .alert("Transaction saved!", isPresented: $showSaved) {
                Button("OK", role: .cancel) { }
            }
        }
    }

    private func save() {
        guard let amount, amount.isFinite, amount > 0, let category else { return }
        viewModel.addTransaction(amount: amount, category: category.name, date: date, type: type)
        amountText = ""
        self.category = nil
        date = Date()
        showSaved = true
    }
}
