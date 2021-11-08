//
//  SearchView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//

import SwiftUI
import Combine

struct SearchView: View {
    @StateObject var vm = SearchStockViewModel()
    @FocusState private var searchIsFocused: Bool
    @State private var showInvestView: Bool = false
    
    var body: some View{
        NavigationView{
            VStack (alignment: .leading, spacing: 0){
                SearchTextField(vm: vm).padding(.bottom)
                
                if(vm.shouldShowResults){
                    SimpleList(textItems: ["Stock Price: $\(vm.stockPrice)", "Estimated Growth: \(vm.stockGrowth)%", "Shareholders: \(vm.stockShareHolders)"])
                    
                    HStack {
                        Spacer()
                        Button(action: {self.showInvestView.toggle()}) {
                            HStack{
                                Image(systemName: "dollarsign.square.fill")
                                Text("Invest")
                            }
                        }.foregroundColor(.blue)
                            .padding()
                            .sheet(isPresented: $showInvestView) {
                                InvestView()
                            }
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
    @State private var stockSymbol: String = ""
    @State private var validated: Bool = false
    
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass").onTapGesture {
                searchIsFocused.toggle()
            }
            TextField("Enter Stock Symbol", text: $stockSymbol)
                .onSubmit {
                    vm.shouldShowResults = true
                    vm.stockSymbol = stockSymbol
                }
                .focused($searchIsFocused)
                .submitLabel(.search)
                .onReceive(Just($stockSymbol)) { _ in limitStockSymbol(5) }
            
            if(searchIsFocused){
                Image(systemName: "x.circle.fill").onTapGesture {
                    vm.stockSymbol = ""
                }
                Button("Cancel") {
                    stockSymbol = ""
                    vm.stockSymbol = ""
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.005, brightness: 0.001)/*@END_MENU_TOKEN@*/)
    }
}
