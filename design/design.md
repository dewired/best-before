# Best Before - Technical Design Document

## 1. Architecture Overview

### 1.1 Technology Stack
- iOS 17.0+
- SwiftUI for UI framework
- SwiftData for data persistence
- Swift Concurrency for async operations
- Local Notifications for alerts
- SF Symbols for iconography

### 1.2 Project Structure
```
BestBefore/
├── App/
│   ├── BestBeforeApp.swift
│   └── AppDelegate.swift
├── Models/
│   ├── Item.swift
│   ├── Category.swift
│   └── NotificationSettings.swift
├── Views/
│   ├── Main/
│   │   ├── ContentView.swift
│   │   ├── ItemListView.swift
│   │   └── DashboardView.swift
│   ├── Items/
│   │   ├── ItemDetailView.swift
│   │   ├── AddItemView.swift
│   │   └── EditItemView.swift
│   ├── Categories/
│   │   └── CategoryListView.swift
│   ├── Statistics/
│   │   └── StatisticsView.swift
│   └── Settings/
│       └── SettingsView.swift
├── ViewModels/
│   ├── ItemViewModel.swift
│   ├── CategoryViewModel.swift
│   └── StatisticsViewModel.swift
├── Services/
│   ├── NotificationService.swift
│   ├── DataService.swift
│   └── ImportService.swift
├── Utils/
│   ├── DateUtils.swift
│   ├── Constants.swift
│   └── Extensions/
└── Resources/
    ├── Assets.xcassets/
    └── Localizable.strings
```

## 2. Data Models

### 2.1 Item Model
```swift
@Model
class Item {
    var id: UUID
    var name: String
    var category: Category
    var expirationDate: Date
    var purchaseDate: Date
    var quantity: Double
    var unit: String
    var notes: String?
    var status: ItemStatus
    var openingState: OpeningState
    var openingDate: Date?
    var originalExpirationDate: Date
    var adjustedExpirationDate: Date?
    var consumptionState: ConsumptionState
    var remainingQuantity: Double
    var remainingPercentage: Double
    var lastConsumptionDate: Date?
    var consumptionHistory: [ConsumptionRecord]
    var location: StorageLocation
    var secondaryLocation: StorageLocation?
    
    // Computed properties
    var daysUntilExpiration: Int { ... }
    var isExpired: Bool { ... }
    var isExpiringSoon: Bool { ... }
}

enum ItemStatus: String, Codable {
    case active
    case consumed
    case expired
}

enum OpeningState: String, Codable {
    case unopened
    case opened
}

enum ConsumptionState: String, Codable {
    case full
    case partial
    case consumed
}

enum StorageLocation: String, Codable {
    case refrigerator
    case freezer
    case pantry
    case counter
    case cabinet
}

struct ConsumptionRecord: Codable {
    let date: Date
    let quantity: Double
    let remainingPercentage: Double
}
```

### 2.2 Category Model
```swift
@Model
class Category {
    var id: UUID
    var name: String
    var icon: String // SF Symbol name
    var color: String // Asset color name
    var defaultUnit: String
    var defaultExpirationPeriod: Int // days
    var openedExpirationPeriod: Int // days
    var subcategories: [Subcategory]
    var notificationSettings: CategoryNotificationSettings
}

struct Subcategory: Codable {
    var name: String
    var defaultUnit: String
    var defaultExpirationPeriod: Int
    var openedExpirationPeriod: Int
}

struct CategoryNotificationSettings: Codable {
    var warningDays: [Int]
    var enabled: Bool
}
```

### 2.3 Notification Settings Model
```swift
@Model
class NotificationSettings {
    var defaultWarningPeriods: [Int]
    var quietHoursStart: Date
    var quietHoursEnd: Date
    var categorySettings: [UUID: CategoryNotificationSettings]
    var enabledNotificationTypes: Set<NotificationType>
}

enum NotificationType: String, Codable {
    case expirationWarning
    case openedItemReminder
    case consumptionAlert
}
```

## 3. Core Features Implementation

### 3.1 Item Management
```swift
class ItemViewModel: ObservableObject {
    @Published private(set) var items: [Item] = []
    private let dataService: DataService
    private let notificationService: NotificationService
    
    // CRUD operations
    func addItem(_ item: Item) async throws
    func updateItem(_ item: Item) async throws
    func deleteItem(_ item: Item) async throws
    func markItemAsOpened(_ item: Item) async throws
    func updateConsumption(_ item: Item, quantity: Double) async throws
    
    // Queries
    func itemsExpiringWithin(days: Int) -> [Item]
    func itemsByCategory(_ category: Category) -> [Item]
    func itemsByLocation(_ location: StorageLocation) -> [Item]
    func searchItems(query: String) -> [Item]
}
```

### 3.2 Notification System
```swift
class NotificationService {
    private let notificationCenter: UNUserNotificationCenter
    
    func scheduleExpirationNotification(for item: Item)
    func scheduleOpenedItemReminder(for item: Item)
    func scheduleConsumptionAlert(for item: Item)
    func cancelNotifications(for item: Item)
    func updateNotificationSettings(_ settings: NotificationSettings)
}
```

### 3.3 Data Service
```swift
class DataService {
    private var context: ModelContext
    
    // CRUD operations
    func save<T: PersistentModel>(_ item: T) throws
    func delete<T: PersistentModel>(_ item: T) throws
    func fetch<T: PersistentModel>(_ predicate: Predicate<T>?) throws -> [T]
    
    // Import operations
    func importFromIntent(items: [IntentItem]) async throws
}
```

## 4. UI Implementation Guidelines

### 4.1 Color System
```swift
enum AppColors {
    static let primary = Color("PrimaryColor")
    static let secondary = Color("SecondaryColor")
    static let background = Color("BackgroundColor")
    static let error = Color("ErrorColor")
    static let warning = Color("WarningColor")
    static let success = Color("SuccessColor")
    
    // Status colors
    static let expired = Color("ExpiredColor")
    static let expiringSoon = Color("ExpiringSoonColor")
    static let good = Color("GoodColor")
}
```

### 4.2 Typography
```swift
enum AppTypography {
    static let titleLarge = Font.system(size: 34, weight: .bold)
    static let titleMedium = Font.system(size: 28, weight: .semibold)
    static let titleSmall = Font.system(size: 22, weight: .medium)
    static let bodyLarge = Font.system(size: 17, weight: .regular)
    static let bodyMedium = Font.system(size: 15, weight: .regular)
    static let caption = Font.system(size: 13, weight: .regular)
}
```

### 4.3 Common UI Components
```swift
struct ItemCard: View {
    let item: Item
    var body: some View {
        // Implementation with consistent styling
    }
}

struct ExpirationBadge: View {
    let daysRemaining: Int
    var body: some View {
        // Implementation with color coding
    }
}

struct CategoryIcon: View {
    let category: Category
    var body: some View {
        // Implementation with SF Symbols
    }
}
```

## 5. Implementation Phases

### Phase 1: Core Features
1. Basic data models and persistence
2. Add/Edit/Delete items
3. Basic list view with sorting
4. Simple notifications

### Phase 2: Enhanced Features
1. Category management
2. Advanced search and filters
3. Consumption tracking
4. Enhanced notifications

### Phase 3: Statistics & Insights
1. Basic statistics
2. Waste tracking
3. Charts and graphs
4. Recommendations

### Phase 4: Polish & Optimization
1. UI/UX improvements
2. Performance optimization
3. Error handling
4. Testing & bug fixes

## 6. Testing Strategy

### 6.1 Unit Tests
- Model validation
- Business logic
- Data persistence
- Notification scheduling

### 6.2 UI Tests
- Navigation flows
- Item management
- Search and filters
- Settings management

### 6.3 Integration Tests
- End-to-end flows
- Data import/export
- Notification delivery

## 7. Error Handling

### 7.1 Error Types
```swift
enum AppError: LocalizedError {
    case itemNotFound
    case invalidData
    case persistenceError
    case notificationError
    case importError
    
    var errorDescription: String? {
        switch self {
            // Localized error messages
        }
    }
}
```

### 7.2 Error Recovery
- Automatic retry for transient errors
- Data validation before persistence
- Graceful degradation of features
- User-friendly error messages

## 8. Performance Considerations

### 8.1 Data Loading
- Pagination for large lists
- Lazy loading of images
- Caching of frequently accessed data

### 8.2 Memory Management
- Proper resource cleanup
- Image size optimization
- Background task management

### 8.3 Battery Usage
- Efficient notification scheduling
- Optimized database queries
- Minimal background processing

## 9. Accessibility

### 9.1 VoiceOver Support
- Meaningful labels
- Proper navigation
- Status announcements

### 9.2 Dynamic Type
- Scalable fonts
- Adaptive layouts
- Minimum tap targets

### 9.3 Color Contrast
- WCAG 2.1 compliance
- High contrast mode support
- Color blindness considerations

## 10. Security

### 10.1 Data Protection
- Local storage only
- iOS data protection
- Secure coding practices

### 10.2 Privacy
- No analytics
- No network access
- No sensitive data collection

## 11. Documentation

### 11.1 Code Documentation
- Swift DocC comments
- Architecture overview
- Implementation guides

### 11.2 User Documentation
- Feature guides
- Troubleshooting
- FAQ

## 12. Resources

### 12.1 Apple Documentation
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata)
- [Local Notifications](https://developer.apple.com/documentation/usernotifications)

### 12.2 Design Resources
- [SF Symbols](https://developer.apple.com/sf-symbols/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/) 