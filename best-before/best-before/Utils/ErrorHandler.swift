import Foundation

enum AppError: LocalizedError {
    case dataError(String)
    case networkError(String)
    case validationError(String)
    case unknownError(String)
    
    var errorDescription: String? {
        switch self {
        case .dataError(let message):
            return "Data Error: \(message)"
        case .networkError(let message):
            return "Network Error: \(message)"
        case .validationError(let message):
            return "Validation Error: \(message)"
        case .unknownError(let message):
            return "Unknown Error: \(message)"
        }
    }
}

class ErrorHandler {
    static let shared = ErrorHandler()
    
    private init() {}
    
    func handle(_ error: Error) {
        // Log error
        print("Error occurred: \(error.localizedDescription)")
        
        // In a real app, we would:
        // 1. Log to analytics
        // 2. Show user-friendly message
        // 3. Report to crash reporting service
    }
    
    func handle(_ error: AppError) {
        handle(error as Error)
    }
} 