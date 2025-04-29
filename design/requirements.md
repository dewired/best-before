# Best Before App Requirements

## Overview
Best Before is an iOS application designed to help users track and manage their food items' expiration dates, reducing food waste and ensuring food safety.

## Core Features

### 1. Item Management
- Add new food items with:
  - Product name
  - Expiration date
  - Category (e.g., Dairy, Meat, Produce, Pantry)
  - Quantity
  - Purchase date
  - Notes (optional)
  - Barcode scanning (future enhancement)
- Edit existing items
- Delete items
- Mark items as consumed
- Import items from Intent app shopping lists

### 2. Organization & Display
- List view of all items
- Group items by:
  - Expiration date (Soon to expire, Expired, Good for a while)
  - Category
  - Storage location (Fridge, Freezer, Pantry)
- Sort items by:
  - Expiration date
  - Name
  - Category
  - Date added

### 3. Notifications
- Push notifications for items approaching expiration
- Customizable notification settings:
  - Days before expiration
  - Notification frequency
  - Quiet hours

### 4. Search & Filter
- Search items by name
- Filter by:
  - Category
  - Expiration status
  - Storage location
  - Date range

### 5. Statistics & Insights
- Food waste tracking
- Consumption patterns
- Expiration trends
- Shopping recommendations

## Technical Requirements

### Platform
- iOS 17.0 and later
- SwiftUI for UI implementation
- SwiftData for persistence

### Data Model
- Item entity with:
  - Unique identifier
  - Product name
  - Expiration date
  - Category
  - Quantity
  - Purchase date
  - Notes
  - Status (Active, Consumed, Expired)
  - Source (Manual, Imported from Intent)

### Import Features
- Import shopping lists from Intent app
- Support for:
  - Bulk import of multiple items
  - Automatic category assignment based on item names
  - Default expiration date settings for imported items
  - Option to review and edit imported items before adding
- Import history tracking

### User Interface
- Clean, intuitive design
- Dark mode support
- Accessibility features
- Responsive layout for different iOS devices

### Performance
- Fast app launch time
- Smooth scrolling and transitions
- Efficient data loading and caching
- Minimal battery impact

## Future Enhancements
1. Barcode scanning for quick item addition
2. Recipe suggestions based on expiring items
3. Shopping list generation
4. Cloud sync across devices
5. Social sharing features
6. Integration with smart home devices
7. Additional shopping list app integrations

## Success Metrics
1. User engagement (daily active users)
2. Number of items tracked
3. Reduction in food waste
4. User retention rate
5. App store ratings and reviews 