# Best Before - Technical Design Document

## 1. Architecture Overview

### 1.1 Technology Stack
- iOS 17.0+
  - Minimum deployment target ensures access to latest SwiftUI and SwiftData features
  - Requires Xcode 15.0 or later
- SwiftUI for UI framework
  - Declarative UI framework
  - Built-in state management
  - Automatic UI updates
- SwiftData for data persistence
  - Apple's new persistence framework
  - Automatic schema management
  - Built-in undo/redo support
- Swift Concurrency for async operations
  - async/await for asynchronous code
  - Task management for background operations
  - Structured concurrency patterns
- Local Notifications for alerts
  - UserNotifications framework
  - Background notification scheduling
  - Rich notification content
- SF Symbols for iconography
  - Apple's system icon set
  - Automatic dark mode support
  - Consistent with iOS design language

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

### 1.3 Architecture Pattern
The app follows the MVVM (Model-View-ViewModel) pattern with the following responsibilities:

- Models: Data structures and business logic
  - SwiftData models for persistence
  - Value types for data transfer
  - Business rules and validation

- Views: User interface components
  - SwiftUI views for UI elements
  - View modifiers for styling
  - Navigation and presentation

- ViewModels: State management and business logic
  - ObservableObject for state updates
  - Business logic coordination
  - Data transformation

- Services: Reusable functionality
  - Data persistence
  - Notification management
  - Data import/export

### 1.4 State Management
The app uses a combination of state management approaches:

1. Local State (@State)
   - Used for view-specific state
   - Short-lived, view-scoped data
   - Form inputs, temporary UI state

2. Observable Objects (@StateObject, @ObservedObject)
   - Used for view model state
   - Long-lived, shared state
   - Business logic and data

3. Environment Objects (@EnvironmentObject)
   - Used for app-wide state
   - Shared across view hierarchy
   - Settings, user preferences

4. SwiftData (@Query)
   - Used for persistent data
   - Automatic updates
   - Database queries

### 1.5 Error Handling Strategy
The app implements a layered error handling approach:

1. Data Layer
   - Validation errors
   - Persistence errors
   - Network errors (future)

2. Business Layer
   - Business rule violations
   - State transition errors
   - Calculation errors

3. Presentation Layer
   - User input validation
   - UI state errors
   - Navigation errors

4. Error Recovery
   - Automatic retry for transient errors
   - Graceful degradation
   - User-friendly error messages

### 1.6 Testing Strategy
The app implements a comprehensive testing approach:

1. Unit Tests
   - Model validation
   - Business logic
   - Data transformations
   - Service layer

2. UI Tests
   - User flows
   - Navigation
   - Input validation
   - State updates

3. Integration Tests
   - Data persistence
   - Notification delivery
   - State management
   - Error handling

4. Performance Tests
   - Data loading
   - UI responsiveness
   - Memory usage
   - Battery impact

## 2. Data Models

### 2.1 Data Flow
The app implements a unidirectional data flow:

1. User Actions
   - Trigger state changes
   - Update view models
   - Modify data models

2. State Updates
   - Propagate through view models
   - Update views automatically
   - Persist changes

3. Data Persistence
   - Automatic saving
   - Background updates
   - Conflict resolution

### 2.2 Model Relationships
The app uses the following model relationships:

1. One-to-Many
   - Category to Items
   - Item to Consumption Records

2. One-to-One
   - Item to Category
   - Item to Location

3. Many-to-Many (future)
   - Items to Recipes
   - Categories to Tags

### 2.3 Data Validation
The app implements validation at multiple levels:

1. Model Level
   - Property constraints
   - Business rules
   - State transitions

2. View Model Level
   - Input validation
   - State validation
   - Business logic

3. View Level
   - User input validation
   - UI state validation
   - Error presentation

## 3. Core Features Implementation

### 3.1 Feature Architecture
Each feature follows a consistent architecture:

1. Data Layer
   - Model definitions
   - Persistence logic
   - Data validation

2. Business Layer
   - View models
   - Business logic
   - State management

3. Presentation Layer
   - Views
   - User interaction
   - Error handling

### 3.2 Feature Dependencies
Features are designed with minimal dependencies:

1. Core Features
   - Item management
   - Category management
   - Basic notifications

2. Enhanced Features
   - Advanced search
   - Statistics
   - Custom notifications

3. Future Features
   - Barcode scanning
   - Recipe integration
   - Cloud sync

### 3.3 Feature Testing
Each feature includes:

1. Unit Tests
   - Model tests
   - View model tests
   - Service tests

2. UI Tests
   - User flow tests
   - State tests
   - Error tests

3. Integration Tests
   - Feature integration
   - Data flow
   - Error handling

## 4. UI Implementation Guidelines

### 4.1 Design System
The app implements a comprehensive design system:

1. Color System
   - Primary colors
   - Status colors
   - Semantic colors
   - Dark mode support

2. Typography
   - Font hierarchy
   - Dynamic type
   - Accessibility

3. Layout
   - Grid system
   - Spacing
   - Alignment
   - Responsive design

4. Components
   - Reusable views
   - Consistent styling
   - Accessibility
   - Dark mode

### 4.2 Navigation
The app uses a hierarchical navigation structure:

1. Tab Navigation
   - Main features
   - Quick access
   - State persistence

2. Stack Navigation
   - Detail views
   - Forms
   - Settings

3. Modal Navigation
   - Add/Edit flows
   - Alerts
   - Actions

### 4.3 Accessibility
The app implements comprehensive accessibility:

1. VoiceOver
   - Meaningful labels
   - Proper navigation
   - Status updates

2. Dynamic Type
   - Scalable fonts
   - Adaptive layouts
   - Minimum sizes

3. Color and Contrast
   - WCAG compliance
   - High contrast
   - Color blindness

## 5. Implementation Phases

### 5.1 Phase Planning
Each phase includes:

1. Core Features
   - Essential functionality
   - Basic UI
   - Data persistence

2. Enhanced Features
   - Advanced functionality
   - Improved UI
   - Performance

3. Polish
   - UI refinement
   - Performance optimization
   - Bug fixes

### 5.2 Phase Dependencies
Phases are designed to be:

1. Independent
   - Minimal dependencies
   - Self-contained
   - Testable

2. Incremental
   - Builds on previous
   - Adds value
   - Maintainable

3. Releasable
   - Working features
   - Tested
   - Documented

## 6. Data Models

### 6.1 Item Model
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

### 6.2 Category Model
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

### 6.3 Notification Settings Model
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

## 7. Core Features Implementation

### 7.1 Item Management
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

### 7.2 Notification System
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

### 7.3 Data Service
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

## 8. UI Implementation Guidelines

### 8.1 Color System
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

### 8.2 Typography
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

### 8.3 Common UI Components
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

## 9. Implementation Phases

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

## 10. Testing Strategy

### 10.1 Unit Tests
- Model validation
- Business logic
- Data persistence
- Notification scheduling

### 10.2 UI Tests
- Navigation flows
- Item management
- Search and filters
- Settings management

### 10.3 Integration Tests
- End-to-end flows
- Data import/export
- Notification delivery

## 11. Error Handling

### 11.1 Error Types
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

### 11.2 Error Recovery
- Automatic retry for transient errors
- Data validation before persistence
- Graceful degradation of features
- User-friendly error messages

## 12. Performance Considerations

### 12.1 Data Loading
- Pagination for large lists
- Lazy loading of images
- Caching of frequently accessed data

### 12.2 Memory Management
- Proper resource cleanup
- Image size optimization
- Background task management

### 12.3 Battery Usage
- Efficient notification scheduling
- Optimized database queries
- Minimal background processing

## 13. Accessibility

### 13.1 VoiceOver Support
- Meaningful labels
- Proper navigation
- Status announcements

### 13.2 Dynamic Type
- Scalable fonts
- Adaptive layouts
- Minimum tap targets

### 13.3 Color Contrast
- WCAG 2.1 compliance
- High contrast mode support
- Color blindness considerations

## 14. Security

### 14.1 Data Protection
- Local storage only
- iOS data protection
- Secure coding practices

### 14.2 Privacy
- No analytics
- No network access
- No sensitive data collection

## 15. Documentation

### 15.1 Code Documentation
- Swift DocC comments
- Architecture overview
- Implementation guides

### 15.2 User Documentation
- Feature guides
- Troubleshooting
- FAQ

## 16. Resources

### 16.1 Apple Documentation
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata)
- [Local Notifications](https://developer.apple.com/documentation/usernotifications)

### 16.2 Design Resources
- [SF Symbols](https://developer.apple.com/sf-symbols/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/) 