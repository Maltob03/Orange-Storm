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
        case Joy, Fear, Anger, Sadness, Unspecified
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .Joy:
                return "🥳"
            case .Fear:
                return "😨"
            case .Anger:
                return "😡"
            case .Sadness:
                return "😭"
            case .Unspecified:
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

    init(id: String = UUID().uuidString, eventType: EventType = .Unspecified, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .Fear, date: Date().diff(numDays: 0), note: "I need to calm down"),
            Event(date: Date().diff(numDays: -1), note: "Get gift for Emily"),
            Event(eventType: .Fear, date: Date().diff(numDays: 6), note: "Now I just need to stay in a safe space."),
            Event(eventType: .Anger, date: Date().diff(numDays: 2), note: "Such a mess!"),
            Event(eventType: .Sadness, date: Date().diff(numDays: -3), note: "Never again!"),
            Event(date: Date().diff(numDays: -4), note: "Plan for winter vacation.")
        ]
    }
}
