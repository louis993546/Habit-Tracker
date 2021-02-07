//
//  EditView.swift
//  Habit Tracker
//
//  Created by Louis Tsai on 2/7/21.
//

import SwiftUI

struct EditView: View {
    @Binding var habitData: Habit.Data
    
    var body: some View {
        List {
            // MARK: - Meta data
            Section {
                TextField("Name", text: $habitData.name)
                ColorPicker("Color", selection: $habitData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            
            // MARK: - Goal
            Section(header: Text("Goal")) {
                Picker("Build/Stop", selection: $habitData.type) {
                    Text("Build").tag(HabitType.moreThan)
                    Text("Stop").tag(HabitType.lessThan)
                }
                Stepper("\(habitData.goal) \(habitData.goal == 1 ? "time" : "times")", value: $habitData.goal)
                Picker("Per", selection: $habitData.period) {
                    Text("Day").tag(HabitPeriod.daily)
                    Text("Week").tag(HabitPeriod.weekly)
                    Text("Month").tag(HabitPeriod.monthly)
                    Text("Year").tag(HabitPeriod.yearly)
                }
            }
            
            // TODO: Edit History would be nice to have
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(habitData: .constant(Habit.Data()))
    }
}
