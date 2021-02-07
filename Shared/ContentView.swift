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
//    @State private var newScrumData = DailyScrum.Data()

    let saveAction: () -> Void

    var body: some View {
//        TabView {
            NavigationView {
                HabitsList(habits: $habits)
                    .navigationTitle("Habits")
                    .navigationBarItems(trailing: Button(action: { print("test" )}){
                        Image(systemName: "plus")
                    })
            }
//            .tabItem {
//                Image(systemName: "list.bullet")
//                Text("Habits")
//            }
//        }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(habits: .constant(Habit.previewArray), saveAction: {})
    }
}
