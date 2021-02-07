//
//  HabitsData.swift
//  Habit Tracker
//
//  Created by Louis Tsai on 2/7/21.
//

import Foundation

class HabitsData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("Can't find document directory")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("habitsData.json")
    }
    
    @Published var habits: [Habit] = []
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                return
            }
            guard let db = try? JSONDecoder().decode(DB.self, from: data) else {
                fatalError("Can't decode saved habits data")
            }
            DispatchQueue.main.async {
                self?.habits = db.data
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let habits = self?.habits else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(DB(version: 1, data: habits)) else {
                fatalError("Error encoding data")
            }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
