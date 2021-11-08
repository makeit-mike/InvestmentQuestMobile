//
//  InvestView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI

struct InvestView: View {
    
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var dateOfBirth: Date = Date.now
    @State private var address: String = ""
    @State private var phoneNumber: String = ""
    
    @State var stockSymbol: String = ""
    @State var showStockInfo: Bool = false
    @State var showInvestView: Bool = false
    @State var stockPrice: Double = 0
    
    var body: some View{
        VStack{
            Text("Invest in \(stockSymbol)").font(.title).padding()
            UserInfoTextInputView(viewResponse: "Full Name:", text: fullName)
            UserInfoTextInputView(viewResponse: "Email Address:", text: email)
            UserInfoTextInputView(viewResponse: "Home Address:", text: address)
            UserInfoTextInputView(viewResponse: "Phone Number:", text: phoneNumber)
            HStack{
                DatePicker(
                    "Date of Birth:",
                    selection: $dateOfBirth,
                    displayedComponents: [.date]
                ).datePickerStyle(.compact)
            }.frame(alignment: .leading).padding(.leading)
            
            HStack{
                Text("Number of stock:").padding()
                Spacer()
                NumberPicker().padding(.trailing).padding(.leading).background(.black.opacity(0.1)).cornerRadius(10).frame(width: 170)
                //Num shares use var
            }
            HStack{
                // total cost = stockCost * numShares
            }
            Spacer()
        }
    }
}

struct NumberPicker: View {
    @State private var number = 50

    var body: some View {
        VStack {
            Picker("", selection: $number) {
                ForEach(0...50, id: \.self) {
                    Text("\(50-$0)")
                }
            }
        }
    }
}

struct InvestView_Previews: PreviewProvider {
    static var previews: some View {
        InvestView()
    }
}
