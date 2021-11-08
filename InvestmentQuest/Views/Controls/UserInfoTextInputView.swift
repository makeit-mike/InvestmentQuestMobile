//
//  UserInfoTextInput.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct UserInfoTextInputView: View {
    @State var viewResponse: String = ""
    @State var text: String = ""
    var body: some View{
        HStack {
            Text(viewResponse)
            Spacer()
            TextField(" ", text: $text)
                .background(.black.opacity(0.1))
                .cornerRadius(7)
                .frame(width: 150, alignment: .trailing)
        }.frame(alignment: .leading).padding()
    }
}

struct UserInfoTextInput_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoTextInputView()
    }
}

// ----------------------------------------------------------------------------------------------------------------
