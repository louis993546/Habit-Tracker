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
                    print("TODO")
                }
            HStack {
                Text(habit.name)
                Spacer()
                Text("0")
            }
            .padding()
        }
    }
}

struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        HabitCard(habit: .constant(Habit.preview))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
