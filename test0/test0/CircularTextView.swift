//
//  CircularTextView.swift
//  test0
//
//  Created by Monophotic on 2023/1/10.
//

import Foundation
import SwiftUI

struct CircularTextView : View {
    var text : String
    var texts : [(offset : Int, element: Character)] {
        return Array(text.enumerated())
    }

    var body: some View {
        VStack {
            ForEach(texts, id: \.offset, content: {
                Text(String($0.element))
            })
        }
    }
}

struct CircularTextViewPreview : PreviewProvider {
    static var previews: some View {
        CircularTextView(
            text: "Latitude 35.08587 E • Longitude 21.43673 W • Elevation 64M • Incline 12 •".uppercased()
        )
    }
}
