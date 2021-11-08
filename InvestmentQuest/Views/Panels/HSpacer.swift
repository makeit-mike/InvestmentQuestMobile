//
//  HSpacer.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

// Simple View that makes sure that a parent view will always use 100% of the available width.
struct HSpacer: View {
    var body: some View {
        HStack{
            Spacer()
        }
    }
}

struct HSpacer_Previews: PreviewProvider {
    static var previews: some View {
        HSpacer()
    }
}
