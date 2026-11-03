import SwiftUI
import Charts

struct SummaryView: View {
    @EnvironmentObject private var viewModel: TransactionsViewModel
    @State private var selectedDate = Date()

    private var month: Int { Calendar.current.component(.month, from: selectedDate) }
    private var year: Int { Calendar.current.component(.year, from: selectedDate) }
    private var totals: (income: Double, expenses: Double) {
        viewModel.getMonthlySummary(for: month, year: year)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    DatePicker("Select month", selection: $selectedDate, displayedComponents: .date)
                    Text("Monthly Overview")
                        .font(.title2.bold())
                    if totals.income + totals.expenses > 0 {
                        Chart {
                            SectorMark(angle: .value("Amount", totals.income))
                                .foregroundStyle(.green)
                            SectorMark(angle: .value("Amount", totals.expenses))
                                .foregroundStyle(.orange)
                        }
                        .frame(height: 250)
                        HStack(spacing: 24) {
                            Label("Income", systemImage: "circle.fill").foregroundStyle(.green)
                            Label("Expenses", systemImage: "circle.fill").foregroundStyle(.orange)
                        }
                        .font(.subheadline)
                    } else {
                        ContentUnavailableView("No data yet", systemImage: "chart.pie", description: Text("Add transactions to see your summary."))
                    }
                    summaryRow("Total Income", value: totals.income, color: .green)
                    summaryRow("Total Expenses", value: totals.expenses, color: .orange)
                    Divider()
                    summaryRow("Balance", value: totals.income - totals.expenses, color: .primary)
                }
                .padding()
            }
            .navigationTitle("Summary")
        }
    }

    private func summaryRow(_ title: String, value: Double, color: Color) -> some View {
        HStack {
            Text(title).font(.headline)
            Spacer()
            Text(value, format: .currency(code: "USD"))
                .font(.headline).foregroundStyle(color)
        }
    }
}
