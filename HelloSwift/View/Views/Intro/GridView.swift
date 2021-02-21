//
//  GridView.swift
//  HelloSwift
//
//

import SwiftUI

struct GridView: View {
    
    @State var app1Tapped = false
    @State var app2Tapped = false
    @State var app3Tapped = false
    @State var app4Tapped = false
    @State var mainViewVisible = true
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            if mainViewVisible {
                HStack {
                    Text("Mini-Apps")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, 15)
            }
            if app1Tapped {
                HomePageView(app1Tapped: $app1Tapped, mainViewVisible: $mainViewVisible)
                    .animation(.spring())
            } else if app2Tapped {
                DivestView(app2Tapped: $app2Tapped, mainViewVisible: $mainViewVisible)
                    .animation(.spring())
            } else if app3Tapped {
                RefugeBRView(app3Tapped: $app3Tapped, mainViewVisible: $mainViewVisible)
                    .animation(.spring())
            } else if app4Tapped {
                BailOutView(app4Tapped: $app4Tapped, mainViewVisible: $mainViewVisible)
                    .animation(.spring())
            } else if mainViewVisible {
                ZStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(spacing: 0), GridItem()]) {
                            Button {
                                withAnimation {
                                    app1Tapped.toggle()
                                    mainViewVisible.toggle()
                                }
                            } label: {
                                VStack {
                                    Image("app1")
                                        .resizable()
                                        .scaledToFit()
                                    Text("Watchr")
                                        .font(.headline)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                        .padding(.top, 5)
                                    Text("An app that allows you to file complaints against police officers")
                                        .font(.caption)
                                        .italic()
                                        .padding(.horizontal)
                                        .padding(.top, 1)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .foregroundColor(Color("mainColor"))
                                        .opacity(0.2)
                                )
                                .multilineTextAlignment(.center)
                                .transition(.move(edge: .bottom))
                            }
                            .padding()
                            .padding(.leading, 10)
                            Button {
                                withAnimation {
                                    app2Tapped.toggle()
                                    mainViewVisible.toggle()
                                }
                            } label: {
                                VStack {
                                    Image("app2")
                                        .resizable()
                                        .scaledToFit()
                                    Text("iDivest")
                                        .font(.headline)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                        .padding(.top, 5)
                                    Text("An app that tracks which universities have divested from fossil fuels")
                                        .font(.caption)
                                        .italic()
                                        .padding(.horizontal)
                                        .padding(.top, 1)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .foregroundColor(Color("mainColor"))
                                        .opacity(0.2)
                                )
                                .multilineTextAlignment(.center)
                                .transition(.move(edge: .bottom))
                            }
                            .padding()
                            .padding(.trailing, 10)
                            Button {
                                withAnimation {
                                    app3Tapped.toggle()
                                    mainViewVisible.toggle()
                                }
                            } label: {
                                VStack {
                                    Image("app3")
                                        .resizable()
                                        .scaledToFit()
                                    Text("Havens")
                                        .font(.headline)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                        .padding(.top, 5)
                                    Text("An app that helps you locate gender-neutral bathrooms that are nearby")
                                        .font(.caption)
                                        .italic()
                                        .padding(.horizontal)
                                        .padding(.top, 1)
                                        .foregroundColor(colorScheme == .dark ? Color.white   : Color.black)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .foregroundColor(Color("mainColor"))
                                        .opacity(0.2)
                                )
                                .multilineTextAlignment(.center)
                                .transition(.move(edge: .bottom))
                            }
                            .padding()
                            .padding(.leading, 10)
                            Button {
                                withAnimation {
                                    app4Tapped.toggle()
                                    mainViewVisible.toggle()
                                }
                            } label: {
                                VStack {
                                    Image("app4")
                                        .resizable()
                                        .scaledToFit()
                                    Text("BailOut")
                                        .font(.headline)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                        .padding(.top, 5)
                                    Text("An app that allows you to donate to bail funds in your area")
                                        .font(.caption)
                                        .italic()
                                        .padding(.horizontal)
                                        .padding(.top, 1)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .foregroundColor(Color("mainColor"))
                                        .opacity(0.2)
                                )
                                .multilineTextAlignment(.center)
                                .transition(.move(edge: .bottom))
                            }
                            .padding()
                            .padding(.trailing, 10)
                        }
                        .padding(.top, -15)
                    } //end ofscrollview
                } //end of zstack
                .animation(.spring())
            } //end of else
            
        }//end of vstack
    }//end of body
}//end of struct

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
        GridView()
            .preferredColorScheme(.dark)
    }
}
