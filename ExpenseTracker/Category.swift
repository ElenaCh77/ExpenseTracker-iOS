import Foundation

struct Category: Identifiable, Hashable {
    let name: String
    let icon: String
    var id: String { name }

    static func sampleCategories(for type: TransactionType) -> [Category] {
        switch type {
        case .income:
            return [Category(name: "Salary", icon: "briefcase.fill"),
                    Category(name: "Bonus", icon: "star.fill"),
                    Category(name: "Freelance", icon: "laptopcomputer"),
                    Category(name: "Other Income", icon: "plus.circle.fill")]
        case .expense:
            return [Category(name: "Bills", icon: "doc.text.fill"),
                    Category(name: "Travel", icon: "airplane"),
                    Category(name: "Grocery", icon: "cart.fill"),
                    Category(name: "Clothes", icon: "bag.fill"),
                    Category(name: "Pets", icon: "pawprint.fill"),
                    Category(name: "Transport", icon: "car.fill"),
                    Category(name: "Gifts", icon: "gift.fill"),
                    Category(name: "Sport", icon: "figure.run"),
                    Category(name: "Food", icon: "fork.knife"),
                    Category(name: "Rent", icon: "house.fill"),
                    Category(name: "Entertainment", icon: "film.fill"),
                    Category(name: "Other", icon: "square.grid.2x2.fill")]
        }
    }

    static func icon(for name: String, type: TransactionType) -> String {
        sampleCategories(for: type).first(where: { $0.name == name })?.icon ?? "tag.fill"
    }
}
