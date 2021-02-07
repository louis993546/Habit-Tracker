//
//  HabitCard.swift
//  Habit Tracker
//
//  Created by Louis Tsai on 2/7/21.
//

import SwiftUI

struct HabitCard: View {
    @Binding var habit: Habit
    
    var body: some View {
        HStack {
            // This cannot be a button because of the NavigationLink from the lsit
            Image(systemName: "plus")
                .onTapGesture {
                    let test = addOneTo(habit, date: Date().stripTime())
                    habit.updateHistory(to: test)
                }
            HStack {
                VStack(alignment: .leading) {
                    Text(habit.name)
                        .font(.headline)
                    Text("\(habit.goal) \(timeOrTimes(habit.goal)) per \(periodToString(habit.period))")
                        .font(.caption)
                }
                Spacer()
                Text("\(habit.history.count)")
            }
            .padding()
        }
    }
    
    func timeOrTimes(_ count: Int) -> String {
        return count == 1 ? "time" : "times"
    }
    
    func periodToString(_ period: HabitPeriod) -> String {
        switch period {
        case .daily:
            return "day"
        case .weekly:
            return "week"
        case .monthly:
            return "month"
        case .yearly:
            return "year"
        }
    }
    
    func addOneTo(_ habit: Habit, date: Date) -> [Date:Int] {
        let historyForDate = habit.history[date]
        return [
            date: (historyForDate ?? 0) + 1
        ]
    }
}

struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        HabitCard(habit: .constant(Habit.preview))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
