//
//  ContentView.swift
//  best-before
//
//  Created by Akash Navani on 4/28/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        ItemDetailView(item: item)
                    } label: {
                        ItemRowView(item: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(
                name: "New Item",
                expirationDate: Date().addingTimeInterval(7 * 24 * 60 * 60), // 7 days from now
                notes: ""
            )
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

struct ItemRowView: View {
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.headline)
            Text("Expires: \(item.expirationDate.formatted(date: .numeric, time: .omitted))")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct ItemDetailView: View {
    let item: Item
    
    var body: some View {
        Form {
            Section("Details") {
                Text("Name: \(item.name)")
                Text("Expiration Date: \(item.expirationDate.formatted())")
                Text("Category: \(item.category)")
                Text("Storage Location: \(item.storageLocation)")
                if !(item.notes?.isEmpty ?? true) {
                    Text("Notes: \(item.notes!)")
                }
            }
            
            Section("Status") {
                Text("Status: \(item.isOpened ? "Opened" : "Unopened")")
                if item.isOpened {
                    if let openedDate = item.openedDate {
                        Text("Opened on: \(openedDate.formatted())")
                    }
                }
                if item.isPartiallyConsumed {
                    Text("Remaining: \((item.remainingQuantity ?? 1.0) * 100, specifier: "%.0f")%")
                }
                if let lastConsumedDate = item.lastConsumedDate {
                    Text("Last consumed: \(lastConsumedDate.formatted())")
                }
            }
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
