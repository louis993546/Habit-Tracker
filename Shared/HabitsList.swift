//
//  HabitsList.swift
//  Habit Tracker
//
//  Created by Louis Tsai on 2/7/21.
//

import SwiftUI

struct HabitsList: View {
    @Binding var habits: [Habit]
    
    var body: some View {
        List(habits) { habit in
            NavigationLink(
                destination: HabitDetail(habit: binding(for: habit)),
                label: {
                    HabitCard(habit: binding(for: habit))
                })
        }
    }
    
    private func binding(for habit: Habit) -> Binding<Habit> {
        guard let habitIndex = habits.firstIndex(where: { $0.id == habit.id }) else {
            fatalError("Cannot find habit \(habit.id) in the array")
        }
        return $habits[habitIndex]
    }
}

struct HabitDetail: View {
    @Binding var habit: Habit
    
    var body: some View {
        Text("Habit detail")
    }
}

struct HabitsList_Previews: PreviewProvider {
    static var previews: some View {
        HabitsList(habits: .constant(Habit.previewArray))
    }
}
