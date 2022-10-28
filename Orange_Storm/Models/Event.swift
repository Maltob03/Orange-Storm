//
//  Event.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 28/10/22.
//

import Foundation


import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case Panic_Attack, Anxiety, social, sport, unspecified
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .Panic_Attack:
                return "🏦"
            case .Anxiety:
                return "🏡"
            case .social:
                return "🎉"
            case .sport:
                return "🏟"
            case .unspecified:
                return "📌"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .Anxiety, date: Date().diff(numDays: 0), note: "Take dog to groomers"),
            Event(date: Date().diff(numDays: -1), note: "Get gift for Emily"),
            Event(eventType: .Anxiety, date: Date().diff(numDays: 6), note: "File tax returns."),
            Event(eventType: .social, date: Date().diff(numDays: 2), note: "Dinner party at Dave and Janet's"),
            Event(eventType: .Panic_Attack, date: Date().diff(numDays: -1), note: "Complete Audit."),
            Event(eventType: .sport, date: Date().diff(numDays: -3), note: "Football Game"),
            Event(date: Date().diff(numDays: -4), note: "Plan for winter vacation.")
        ]
    }
}
