//
//  best_beforeApp.swift
//  best-before
//
//  Created by Akash Navani on 4/28/25.
//

import SwiftUI
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure app environment
        configureEnvironment()
        return true
    }
    
    private func configureEnvironment() {
        // Set up any environment-specific configuration
        #if DEBUG
        print("Running in DEBUG mode")
        #else
        print("Running in RELEASE mode")
        #endif
    }
}

@main
struct best_beforeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, sharedModelContainer.mainContext)
        }
        .modelContainer(sharedModelContainer)
    }
}
