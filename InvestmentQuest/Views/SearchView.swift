//
//  SearchView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @State private var stockSymbol: String = ""
    
    @State private var showStockInfo: Bool = false
    @State private var showInvestView: Bool = false
    @State private var stockPrice: Double = Double.random(in: 20 ..< 1000)
    @State private var stockGrowth: Double = Double.random(in: 0 ..< 1)
    @State private var stockShareHolders: Int = Int.random(in: 50 ..< 10000000)
    
    @FocusState private var searchIsFocused: Bool
    
    
    @StateObject var vm = SearchStockViewModel()
    
    var body: some View{
        NavigationView{
            VStack (alignment: .leading, spacing: 0){
                SearchTextField(vm: vm)
                
                if(vm.shouldShowResults){
                    Divider().background(.white).padding(6)
                    Text("Stock information for: \(stockSymbol)").foregroundColor(.white)
                    VStack(alignment: .leading){
                        SimpleList(textItems: ["Stock Price: $\(stockPrice)", "Estimated Growth: \(stockGrowth)%", "Shareholders: \(stockShareHolders)"])
                    }.padding().background(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255)).cornerRadius(15)
                    
                    Button(action: {self.showInvestView.toggle()}) {
                        HStack{
                            Image(systemName: "dollarsign.square.fill")
                            Text("Invest")
                        }
                    }.frame(width: 80, alignment: .topLeading).padding(10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .sheet(isPresented: $showInvestView) {
                            InvestView()
                        }
                }
                Spacer()
            }.background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.145).edgesIgnoringSafeArea(.all))
            
        }.navigationTitle("Search")
    }
    
}

struct SearchTextField: View {
    @StateObject var vm: SearchStockViewModel
    
    @FocusState private var searchIsFocused: Bool
    @State var stockSymbol: String = ""
    @State private var validated: Bool = false
    
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass").onTapGesture {
                searchIsFocused.toggle()
            }
            TextField("Enter Stock Symbol", text: $stockSymbol)
                .onSubmit {
                    vm.shouldShowResults = true
                }
                .focused($searchIsFocused)
                .submitLabel(.search)
                .onReceive(Just($stockSymbol)) { _ in limitStockSymbol(5) }
            
            if(searchIsFocused){
                Image(systemName: "x.circle.fill").onTapGesture {
                    stockSymbol = ""
                }
                Button("Cancel") {
                    stockSymbol = ""
                    searchIsFocused.toggle()
                    vm.shouldShowResults = false
                }
            }
        }
        .frame(alignment: .topLeading)
        .padding()
        .background(Color(.systemGray4))
        .cornerRadius(20)
    }
    
    func limitStockSymbol(_ upper: Int) {
        stockSymbol = String(stockSymbol.prefix(upper)).uppercased()
    }
}

struct SimpleList: View {
    @State var textItems: [String]
    var body: some View {
        VStack(alignment: .leading){
            ForEach(textItems, id: \.self){ i in
                Text(i).foregroundColor(.white)
                Divider().background(.black).padding(0)
            }
        }.padding().background(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255)).cornerRadius(15)
    }
}


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
            Text("Invest in me senpai")
            UserInfoTextInput(viewResponse: "Full Name:", text: fullName)
            UserInfoTextInput(viewResponse: "Email Address:", text: email)
            UserInfoTextInput(viewResponse: "Home Address:", text: address)
            UserInfoTextInput(viewResponse: "Phone Number:", text: phoneNumber)
            
            HStack{
                Text("Date of Birth:").frame(width: 200)
                DatePicker(
                    "Start Date",
                    selection: $dateOfBirth,
                    displayedComponents: [.date]
                ).frame(width: 120, alignment: .topLeading)
            }
            
            HStack{
                //Num shares use var
            }
            HStack{
                // total cost = stockCost * numShares
            }
        }
    }
}

struct UserInfoTextInput: View {
    @State var viewResponse: String = ""
    @State var text: String = ""
    var body: some View{
        HStack{
            Text(viewResponse).frame(width: 200)
            TextField("", text: $text)
                .foregroundColor(.white)
                .background(.gray)
                .padding(10)
                .cornerRadius(40)
                .frame(width: 120, alignment: .topLeading)
                .font(.title).opacity(0.5)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.005, brightness: 0.001)/*@END_MENU_TOKEN@*/)
    }
}
