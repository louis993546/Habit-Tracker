//
//  ContentView.swift
//  Shared
//
//  Created by Louis Tsai on 2/7/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var habits: [Habit]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresented = false
    @State private var newHabitData = Habit.Data()
    
    let saveAction: () -> Void
    
    var body: some View {
        TabView {
            NavigationView {
                HabitsList(habits: $habits)
                    .navigationTitle("Habits")
                    .toolbar{
                        ToolbarItem(placement: .primaryAction) {
                            Button(action: { isPresented = true }){
                                Image(systemName: "plus")
                            }
                        }
                    }
            }
            .sheet(isPresented: $isPresented) {
                NavigationView {
                    EditView(habitData: $newHabitData)
                        .navigationTitle("New Habit")
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button(action: {
                                    let newHabit = createNewHabit()
                                    habits.append(newHabit)
                                    isPresented = false
                                }) {
                                    Text("Save")
                                }
                            }
                            ToolbarItem(placement: .cancellationAction) {
                                Button(action: { isPresented = false }) {
                                    Text("Cancel")
                                }
                            }
                        }
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Habits")
            }
            
            // TODO: make debug less obvious, so that I can hide it with #if DEBUG
            DebugView(habits: $habits)
                .tabItem {
                    Image(systemName: "ladybug")
                    Text("Debug")
                }
        }
    }
    
    private func createNewHabit() -> Habit {
        return Habit(
            name: newHabitData.name,
            color: newHabitData.color,
            createdAt: Date(),
            type: newHabitData.type,
            goal: newHabitData.goal,
            period: newHabitData.period
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(habits: .constant(Habit.previewArray), saveAction: {})
    }
}
