//
//  AddHabitView.swift
//  HabitTrackerApp
//
//  Created by kukalakunta sasank on 2/9/25.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var viewModel: HabitTrackerViewModel
    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()

    var body: some View {
        Form {
            Section(header: Text("Habit Details")) {
                TextField("Habit Name", text: $name)
                DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
            }
            Button(action: {
                viewModel.addHabit(name: name, startTime: startTime, endTime: endTime)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save Habit")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(name.isEmpty)
        }
        .navigationTitle("Add New Habit")
    }
}

