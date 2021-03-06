//
//  Models.swift
//  Habit Tracker
//
//  Created by Louis Tsai on 2/7/21.
//

import SwiftUI

/// A very brute force way to handle saved JSON with different versions.
struct DB: Codable {
    var version: Int
    var data: [Habit]
}

struct Habit: Identifiable, Codable {
    let id: UUID
    
    var name: String
    var color: Color
    var createdAt: Date
    var history: [Date:Int]
    var type: HabitType
    var goal: Int
    var period: HabitPeriod
    
    init(
        id: UUID = UUID(),
        name: String,
        color: Color,
        createdAt: Date,
        type: HabitType = .moreThan,
        goal: Int = 1,
        period: HabitPeriod = .daily,
        history: [Date:Int] = [:]
    ) {
        self.id = id
        self.name = name
        self.color = color
        self.createdAt = createdAt
        self.type = type
        self.goal = goal
        self.period = period
        self.history = history
    }
}

enum HabitType : String, Codable {
    case moreThan
    case lessThan
}

enum HabitPeriod : String, Codable {
    case daily
    case weekly
    case monthly
    case yearly
}

extension Habit {
    static let preview = Habit(name: "demo", color: Color.white, createdAt: Date())
    static let previewArray = [
        preview,
        preview,
    ]
    
    struct Data {
        var name: String = ""
        var color: Color = .random
        var type: HabitType = .moreThan
        var goal: Int = 1
        var period: HabitPeriod = .daily
    }
    
    var data: Data {
        return Data(
            name: name,
            color: color,
            type: type,
            goal: goal,
            period: period
        )
    }
    
    mutating func update(from data: Data) {
        name = data.name
        color = data.color
        type = data.type
        goal = data.goal
        period = data.period
    }
    
    mutating func updateHistory(to data: [Date:Int]) {
        history = data
    }
}
