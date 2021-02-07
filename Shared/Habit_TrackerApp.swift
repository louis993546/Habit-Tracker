//
//  Habit_TrackerApp.swift
//  Shared
//
//  Created by Louis Tsai on 2/7/21.
//

import SwiftUI

@main
struct Habit_TrackerApp: App {
    @ObservedObject private var data = HabitsData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(habits: $data.habits, saveAction: { data.save() })
                .onAppear {
                    data.load()
                }
        }
    }
}
