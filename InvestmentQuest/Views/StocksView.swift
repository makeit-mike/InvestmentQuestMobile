//
//  StocksView.swift
//  InvestmentQuest
//
//  Created by Michael Jones on 11/7/21.
//
import SwiftUI
import Combine


struct NavButton: Identifiable {
    let id = UUID()
    let navName: String
    let navIcon: String
    let navPath: StocksViewModel.StockViews
}

let NavButtons: [NavButton] = [NavButton(navName: "Portfolio", navIcon: "magazine", navPath: .Portfolio),
                               NavButton(navName: "Search", navIcon: "magnifyingglass", navPath: .Search),
                               NavButton(navName: "Settings", navIcon: "gear", navPath: .Settings)
                                ]

struct StocksView: View {
    @StateObject var vm = StocksViewModel()
    var body: some View{
        NavigationView{
            VStack{
                VStack{
                    switch vm.selectedView {
                    case .Settings:
                        SettingsView()
                    case .Search:
                        SearchView()
                    default:
                        HomeView()
                    }
                }
                VStack{
                    HStack{
                        ForEach(NavButtons) { btn in
                            Button(action: {vm.SwitchView(itemView: btn.navPath)}) {
                                VStack {
                                    Image(systemName: btn.navIcon)
                                        .font(.title).frame(width: 35, height: 35)
                                    Text(btn.navName)
                                        .fontWeight(.light)
                                        .font(.caption)
                                }.frame(width: 50, height: 50, alignment: .top)
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                            }
                        }
                    }.font(.title2)
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 50,
                    alignment: .center
                ).opacity(0.6)
            }.padding(10).background(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.145)).foregroundColor(.white).preferredColorScheme(.dark)
        }.environmentObject(vm)
    }
}

struct HeaderView: View {
    var body: some View{
        VStack{
            Text("Investment Quest")
                .fontWeight(.semibold)
                .font(.title).padding(10)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: 90,
            alignment: .topLeading
        )
    }
}


struct StocksView_Previews: PreviewProvider {
    static var previews: some View {
        StocksView()
    }
}
