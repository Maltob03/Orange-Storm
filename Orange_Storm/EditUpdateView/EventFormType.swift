//
//  EventFormType.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 28/10/22.
//

import SwiftUI

enum EventFormType: Identifiable, View {
    case new
    case update(Event)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }

    var body: some View {
        switch self {
        case .new:
            return EventFormView(viewModel: EventFormViewModel())
        case .update(let event):
            return EventFormView(viewModel: EventFormViewModel(event))
        }
    }
}
