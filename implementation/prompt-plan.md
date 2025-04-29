# Best Before - LLM Implementation Prompt Plan

## Overview
This document outlines a series of prompts to guide an LLM agent through implementing the Best Before app in a test-driven, incremental manner. Each prompt builds upon previous work and ensures all code is properly integrated.

## Phase 1: Foundation Setup

### Prompt 1: Project Setup and Basic Configuration
```
Create a new iOS project with the following requirements:
1. iOS 17.0+ target
2. SwiftUI interface
3. SwiftData for persistence
4. Basic project structure following MVVM pattern

Include:
- Project configuration
- Basic app structure
- Directory organization
- Initial test setup

Verify:
- Project builds successfully
- Tests run without errors
- Basic app launches
```

### Prompt 2: Core Data Models - Part 1
```
Implement the Item model with basic properties and tests:
1. Create ItemTests.swift with initial test cases
2. Implement Item.swift with basic properties
3. Add SwiftData configuration
4. Implement basic validation rules

Focus on:
- Test coverage for all properties
- Data validation
- SwiftData integration
- Error handling

Verify:
- All tests pass
- Model can be persisted
- Validation works correctly
```

### Prompt 3: Core Data Models - Part 2
```
Extend the Item model with state management:
1. Add state-related properties
2. Implement state transitions
3. Add computed properties
4. Update tests

Focus on:
- State transition logic
- Date calculations
- Validation rules
- Error cases

Verify:
- All state transitions work
- Date calculations are accurate
- Tests cover edge cases
```

### Prompt 4: Core Data Models - Part 3
```
Implement Category model and its relationship with Item:
1. Create CategoryTests.swift
2. Implement Category.swift
3. Add default categories
4. Update Item model with category relationship

Focus on:
- Category-Item relationship
- Default data
- Validation rules
- Error handling

Verify:
- Relationships work correctly
- Default data is valid
- Tests cover all cases
```

### Prompt 5: Basic UI Framework - Part 1
```
Implement the design system foundation:
1. Create AppColors.swift
2. Create AppTypography.swift
3. Add basic view modifiers
4. Create test views

Focus on:
- Color definitions
- Typography system
- View modifiers
- Dark mode support

Verify:
- Colors work in both modes
- Typography scales correctly
- Modifiers apply properly
```

### Prompt 6: Basic UI Framework - Part 2
```
Implement navigation structure:
1. Create main tab view
2. Add navigation stack
3. Implement modal presentation
4. Add navigation tests

Focus on:
- Tab bar setup
- Navigation flow
- State management
- Error handling

Verify:
- Navigation works correctly
- State persists properly
- Tests cover all flows
```

## Phase 2: Core Features

### Prompt 7: Item Management - Part 1
```
Implement ItemViewModel with basic CRUD:
1. Create ItemViewModelTests.swift
2. Implement ItemViewModel.swift
3. Add basic CRUD operations
4. Implement error handling

Focus on:
- CRUD operations
- State management
- Error handling
- Test coverage

Verify:
- All operations work
- State updates correctly
- Errors are handled
- Tests pass
```

### Prompt 8: Item Management - Part 2
```
Implement item list view:
1. Create ItemListViewTests.swift
2. Implement ItemListView.swift
3. Add item cards
4. Implement sorting

Focus on:
- List display
- Card design
- Sorting logic
- Performance

Verify:
- List displays correctly
- Cards render properly
- Sorting works
- Tests pass
```

### Prompt 9: Item Management - Part 3
```
Implement add/edit item flow:
1. Create AddItemViewTests.swift
2. Implement AddItemView.swift
3. Add form validation
4. Implement state updates

Focus on:
- Form validation
- Category selection
- Date picking
- Error handling

Verify:
- Forms work correctly
- Validation is complete
- State updates properly
- Tests pass
```

### Prompt 10: Category Management
```
Implement category management:
1. Create CategoryViewModelTests.swift
2. Implement CategoryViewModel.swift
3. Create category views
4. Add category editing

Focus on:
- Category CRUD
- Default categories
- UI implementation
- State management

Verify:
- Categories work correctly
- UI is responsive
- State updates properly
- Tests pass
```

### Prompt 11: Basic Notifications
```
Implement notification system:
1. Create NotificationServiceTests.swift
2. Implement NotificationService.swift
3. Add permission handling
4. Implement basic scheduling

Focus on:
- Permission handling
- Notification scheduling
- Error handling
- State management

Verify:
- Notifications work
- Permissions are handled
- Errors are managed
- Tests pass
```

## Phase 3: Enhanced Features

### Prompt 12: Search and Filtering
```
Implement search functionality:
1. Create SearchTests.swift
2. Implement search logic
3. Add filter system
4. Create search UI

Focus on:
- Search algorithm
- Filter implementation
- UI responsiveness
- Performance

Verify:
- Search works correctly
- Filters apply properly
- UI is responsive
- Tests pass
```

### Prompt 13: Item Status Management
```
Implement status management:
1. Create StatusTests.swift
2. Implement status logic
3. Add status UI
4. Update item model

Focus on:
- Status transitions
- UI updates
- State management
- Error handling

Verify:
- Status changes work
- UI updates properly
- State is consistent
- Tests pass
```

### Prompt 14: Enhanced Notifications
```
Implement enhanced notifications:
1. Create EnhancedNotificationTests.swift
2. Implement custom notifications
3. Add notification preferences
4. Create management UI

Focus on:
- Custom notifications
- User preferences
- UI implementation
- State management

Verify:
- Notifications work
- Preferences are saved
- UI is responsive
- Tests pass
```

## Phase 4: Statistics and Insights

### Prompt 15: Basic Statistics
```
Implement statistics system:
1. Create StatisticsTests.swift
2. Implement statistics service
3. Add basic calculations
4. Create statistics views

Focus on:
- Data aggregation
- Calculations
- UI implementation
- Performance

Verify:
- Calculations are accurate
- UI displays correctly
- Performance is good
- Tests pass
```

### Prompt 16: Waste Tracking
```
Implement waste tracking:
1. Create WasteTrackingTests.swift
2. Implement waste calculations
3. Add tracking UI
4. Create insights

Focus on:
- Waste calculations
- UI implementation
- Data persistence
- Performance

Verify:
- Calculations are accurate
- UI is responsive
- Data persists
- Tests pass
```

## Phase 5: Polish and Optimization

### Prompt 17: UI Refinement
```
Implement UI polish:
1. Create UITests.swift
2. Add dark mode
3. Implement animations
4. Refine typography

Focus on:
- Dark mode support
- Animation quality
- Typography refinement
- Performance

Verify:
- Dark mode works
- Animations are smooth
- Typography is consistent
- Tests pass
```

### Prompt 18: Performance Optimization
```
Implement performance improvements:
1. Create PerformanceTests.swift
2. Optimize data loading
3. Improve memory usage
4. Enhance battery efficiency

Focus on:
- Data loading
- Memory management
- Battery usage
- Performance metrics

Verify:
- Performance is improved
- Memory usage is optimized
- Battery impact is minimal
- Tests pass
```

## Phase 6: Documentation and Release

### Prompt 19: Documentation
```
Implement documentation:
1. Add code comments
2. Create technical docs
3. Write user guides
4. Prepare release notes

Focus on:
- Code documentation
- Technical accuracy
- User clarity
- Completeness

Verify:
- Documentation is complete
- Code is well-documented
- Guides are clear
- Tests pass
```

### Prompt 20: Final Integration
```
Perform final integration:
1. Run all tests
2. Fix any issues
3. Verify all features
4. Prepare for release

Focus on:
- Test coverage
- Feature completeness
- Performance
- Release readiness

Verify:
- All tests pass
- All features work
- Performance is good
- App is ready for release
```

## Implementation Guidelines

### For Each Prompt
1. Start with tests
2. Implement minimal code to pass tests
3. Refactor for clarity and performance
4. Verify all previous functionality
5. Document changes

### Testing Strategy
1. Unit tests for all models
2. Integration tests for features
3. UI tests for critical paths
4. Performance tests for key features

### Code Quality
1. Follow Swift style guide
2. Use SwiftLint
3. Document public interfaces
4. Review code before proceeding

### Integration Points
1. Each feature must integrate with previous work
2. No orphaned code
3. All features must be testable
4. State must be consistent

### Progress Tracking
1. Each prompt should build on previous work
2. No large jumps in complexity
3. Regular verification of all features
4. Continuous integration of new code 