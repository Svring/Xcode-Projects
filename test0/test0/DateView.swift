//
//  DateView.swift
//  test0
//
//  Created by Monophotic on 2023/1/2.
//

import Foundation
import SwiftUI

struct DateView : View {
    @State var date = Date()

    var body: some View {
        VStack {
            DatePicker("Pick a Date", selection: $date, in: ...Date(), displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(GraphicalDatePickerStyle())
        }
        .padding()
    }
}

struct DateViewPreview : PreviewProvider {
    static var previews: some View {
        DateView()
    }
}

