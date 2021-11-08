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
    
    var body: some View{
        NavigationView{
            VStack (alignment: .leading, spacing: 0){
                SearchTextField(vm: vm)
                
                if(vm.shouldShowResults){
                    StockSearchResults(vm: vm)
                }
                Spacer()
            }.background(Stocks_GrayBackground)
        }.navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

// ----------------------------------------------------------------------------------------------------------------
// Subviews

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
        .padding(.bottom)
    }
    
    func limitStockSymbol(_ upper: Int) {
        stockSymbol = String(stockSymbol.prefix(upper)).uppercased()
    }
}

struct StockSearchResults: View {
    @StateObject var vm: SearchStockViewModel
    @State private var showInvestView: Bool = false
    
    var body: some View {
        SimpleList(textItems: StockInfo(vm: vm))

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
                    InvestView(stockSymbol: vm.stockSymbol)
                }
        }
    }
}

