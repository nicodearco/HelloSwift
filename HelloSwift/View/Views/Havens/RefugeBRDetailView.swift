//
//  RefugeBRDetailView.swift
//  HelloSwift
//
//

import SwiftUI

struct RefugeBRDetailView: View {
    @Binding var swiftUIModeActive: Bool
    var restroom : Restroom
    @State var vStackViewIsActive = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    Text(restroom.name)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                        .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                        .onTapGesture {
                            if swiftUIModeActive {
                                vStackViewIsActive = true
                            }
                        }
                        .sheet(isPresented: $vStackViewIsActive) {
                            VStackViewHaven(title: "", view:
                                                AnyView(
                                                    Text(restroom.name)
                                                        .font(.largeTitle)
                                                        .bold()
                                                        .padding()
                                                )
                                )
                        }
                    Text(restroom.street)
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                        .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                        .onTapGesture {
                            if swiftUIModeActive {
                                vStackViewIsActive = true
                            }
                        }
                        .sheet(isPresented: $vStackViewIsActive) {
                            VStackViewHaven(title: "", view:
                                                AnyView(
                                                    Text(restroom.street)
                                                        .font(.title2)
                                                        .fixedSize(horizontal: false, vertical: true)
                                                )
                                )
                        }
                    HStack {
                        Text(restroom.city)
                        Text(restroom.state)
                    }
                    .font(.title2)
                    .fixedSize(horizontal: false, vertical: true)
                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                    .onTapGesture {
                        if swiftUIModeActive {
                            vStackViewIsActive = true
                        }
                    }
                    .sheet(isPresented: $vStackViewIsActive) {
                        VStackViewHaven(title: "", view:
                                            AnyView(
                                                HStack {
                                                    Text(restroom.city)
                                                    Text(restroom.state)
                                                }
                                                .font(.title2)
                                            )
                            )
                    }
                    HStack {
                        Text("Country:")
                            .bold()
                        Text(restroom.country)
                    }
                    .font(.title2)
                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                    .onTapGesture {
                        if swiftUIModeActive {
                            vStackViewIsActive = true
                        }
                    }
                    .sheet(isPresented: $vStackViewIsActive) {
                        VStackViewHaven(title: "", view:
                                            AnyView(
                                                HStack {
                                                    Text("Country:")
                                                        .bold()
                                                    Text(restroom.country)
                                                }
                                                .font(.title2)
                                            )
                            )
                    }
                    VStack {
                        Text("Directions:")
                            .bold()
                        if restroom.directions == "" {
                            Text("None")
                        } else {
                            Text(restroom.directions)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .font(.title3)
                    .padding()
                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                    .onTapGesture {
                        if swiftUIModeActive {
                            vStackViewIsActive = true
                        }
                    }
                    .sheet(isPresented: $vStackViewIsActive) {
                        VStackViewHaven(title: "", view:
                                            AnyView(
                                                VStack {
                                                    Text("Directions:")
                                                        .bold()
                                                    if restroom.directions == "" {
                                                        Text("None")
                                                    } else {
                                                        Text(restroom.directions)
                                                            .fixedSize(horizontal: false, vertical: true)
                                                    }
                                                }
                                                .font(.title3)
                                                .padding()
                                            )
                            )
                    }
                    VStack {
                        Text("Comments: ")
                            .bold()
                        if restroom.comment == "" {
                            Text("None")
                        } else {
                            Text(restroom.comment)
                                .fixedSize(horizontal: false, vertical: true)

                        }
                    }
                    .font(.title3)
                    .padding()
                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                    .onTapGesture {
                        if swiftUIModeActive {
                            vStackViewIsActive = true
                        }
                    }
                    .sheet(isPresented: $vStackViewIsActive) {
                        VStackViewHaven(title: "", view:
                                            AnyView(
                                                VStack {
                                                    Text("Comments: ")
                                                        .bold()
                                                    if restroom.comment == "" {
                                                        Text("None")
                                                    } else {
                                                        Text(restroom.comment)
                                                            .fixedSize(horizontal: false, vertical: true)

                                                    }
                                                }
                                                .font(.title3)
                                                .padding()
                                            )
                            )
                    }
                    VStack {
                        Text("ADA Accessible:")
                            .bold()
                        if restroom.accessible {
                            Text("Verified")
                            Image(systemName: "checkmark.seal")
                        } else {
                            Text("Unverified")
                            Image(systemName: "xmark.seal")
                        }
                    }
                    .font(.title3)
                    .padding()
                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                    .onTapGesture {
                        if swiftUIModeActive {
                            vStackViewIsActive = true
                        }
                    }
                    .sheet(isPresented: $vStackViewIsActive) {
                        VStackViewHaven(title: "", view:
                                            AnyView(
                                                VStack {
                                                    Text("ADA Accessible:")
                                                        .bold()
                                                    if restroom.accessible {
                                                        Text("Verified")
                                                        Image(systemName: "checkmark.seal")
                                                    } else {
                                                        Text("Unverified")
                                                        Image(systemName: "xmark.seal")
                                                    }
                                                }
                                                .font(.title3)
                                                .padding()
                                            )
                            )
                    }
                    VStack {
                        Text("Changing Table:")
                            .bold()
                        if restroom.changing_table {
                            Text("Available")
                            Image(systemName: "checkmark.seal.fill")
                        } else {
                            Text("None")
                            Image(systemName: "xmark.seal.fill")
                        }
                    }
                    .font(.title3)
                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                    .onTapGesture {
                        if swiftUIModeActive {
                            vStackViewIsActive = true
                        }
                    }
                    .sheet(isPresented: $vStackViewIsActive) {
                        VStackViewHaven(title: "", view:
                                            AnyView(
                                                VStack {
                                                    Text("Changing Table:")
                                                        .bold()
                                                    if restroom.changing_table {
                                                        Text("Available")
                                                        Image(systemName: "checkmark.seal.fill")
                                                    } else {
                                                        Text("None")
                                                        Image(systemName: "xmark.seal.fill")
                                                    }
                                                }
                                                .font(.title3)
                                            )
                            )
                    }
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .font(.title)
                        Text(String(restroom.upvote))
                        Image(systemName: "hand.thumbsdown")
                            .font(.title)
                        Text(String(restroom.downvote))
                    }
                    .padding()
                    .padding()
                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                    
                    .onTapGesture {
                        if swiftUIModeActive {
                            vStackViewIsActive = true
                        }
                    }
                    .sheet(isPresented: $vStackViewIsActive) {
                        VStackViewHaven(title: "", view:
                                            AnyView(HStack {
                                                Image(systemName: "hand.thumbsup.fill")
                                                    .font(.title)
                                                Text(String(restroom.upvote))
                                                Image(systemName: "hand.thumbsdown")
                                                    .font(.title)
                                                Text(String(restroom.downvote))
                                            }
                                            .padding()
                                            .padding())
                            )
                    }
                }
                .padding()
                .multilineTextAlignment(.center)
//                .padding(.bottom, 55)
            }
        }
    }
}

struct RefugeBRDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RefugeBRDetailView(swiftUIModeActive: .constant(false), restroom: restrooms[0])
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//        RefugeBRDetailView(restroom: restrooms[1])
//        RefugeBRDetailView(restroom: restrooms[3])
//            .previewDevice("iPhone SE (2nd generation)")


    }
}
