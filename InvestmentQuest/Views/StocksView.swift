//
//  StocksView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//
import SwiftUI
import Combine

struct StocksView: View {
    @StateObject var vm = StocksViewModel()
    var body: some View{
        NavigationView{
            VStack{
                switch vm.selectedView {
                case .Settings:
                    SettingsView()
                case .Search:
                    SearchView()
                case .Portfolio:
                    PortfolioView()
                default:
                    HomeView()
                }
                FooterView(vm:vm)
            }
            .padding(10)
            .background(Stocks_GrayBackground)
            .foregroundColor(.white)
            .preferredColorScheme(.dark)
        }.environmentObject(vm)
    }
}

struct StocksView_Previews: PreviewProvider {
    static var previews: some View {
        StocksView()
    }
}
