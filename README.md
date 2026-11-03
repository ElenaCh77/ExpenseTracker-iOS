# Expense Tracker - iOS App

Expense Tracker — iOS App
Expense Tracker is an iOS application built with SwiftUI to help users organize their personal finances. Users can record income and expenses, browse transactions, and review monthly financial summaries.
Features
- Add income and expense transactions with an amount, category, and date
- Browse transactions and remove entries
- Filter transaction history by month
- View monthly income, expenses, and remaining balance
- Explore income and expense totals in a pie chart
- Store transaction data locally on the device
- Navigate between transaction history, summaries, and transaction entry
Technologies Used
- Swift — application logic and data models
- SwiftUI — user interface and navigation
- Swift Charts — visual financial summaries
- ObservableObject and @Published — updates to transaction data across views
- Codable and UserDefaults — local transaction storage
Project Structure
File	Purpose
ExpenseTrackerApp.swift	Application entry point
WelcomeView.swift	Welcome screen
ContentView.swift	Main navigation
AddTransactionView.swift	Form for adding transactions
TransactionsListView.swift	Transaction history
SummaryView.swift	Monthly financial overview and chart
TransactionsViewModel.swift	Transaction management and calculations
Transaction.swift	Transaction data model
Category.swift	Income and expense categories


Running the App
1. Open ExpenseTracker.xcodeproj in Xcode on a Mac.
2. Select an iOS simulator or a connected iPhone.
3. Build and run the application.
About the Project
This project demonstrates iOS development fundamentals, including SwiftUI layouts, reusable views, state management, data modeling, local storage, and data visualization.
