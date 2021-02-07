//
//  DebugView.swift
//  Habit Tracker
//
//  Created by Louis Tsai on 2/7/21.
//

import SwiftUI

struct DebugView: View {
    @Binding var habits: [Habit]
    
    func generateJson(data: [Habit]) -> String {
        guard let output = try? JSONEncoder().encode(data) else {
            fatalError("Error encoding data")
        }
        return output.prettyPrintedJSONString! as String
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Button(action: { UIPasteboard.general.string = generateJson(data: habits) }) {
                    Text("Copy")
                }
                Text("\(generateJson(data: habits))")
                    .lineLimit(nil)
                    .font(.system(.body, design: .monospaced))
            }
        }
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView(habits: .constant(Habit.previewArray))
    }
}
