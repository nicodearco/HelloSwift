//
//  BailOutView.swift
//  HelloSwift
//
//

import SwiftUI

struct BailOutView: View {
    
    @Binding var app4Tapped: Bool
    @Binding var mainViewVisible: Bool
    @State var swiftUIModeActive = false
    @State var sectionViewActive = false
    @State var vStackViewActive = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9489305615, green: 0.9490671754, blue: 0.9693607688, alpha: 1))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView {
                VStack {
                    HStack {
                        Text("Bail Funds")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal, 17)
                    .padding(.vertical, 15)
                    ForEach(bailFundsByState) { state in
                        VStack {
                            HStack {
                                Text(state.state)
                                    .textCase(.uppercase)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 20)
                                Spacer()
                            }
                            VStack {
                                ForEach(Array(zip(state.bailFunds.indices, state.bailFunds)), id:\.0) { index, bailFund in

                                        VStack {
                                            VStack {

                                                //design the below


                                                HStack {
                                                    Image(systemName: "dollarsign.circle")
                                                        .font(.title2)
                                                        .foregroundColor(.black)
                                                    Text(bailFund.name)
                                                        .font(.title2)
                                                        .bold()
                                                        .foregroundColor(.black)
                                                    Spacer()

                                                }
                                                .padding(.horizontal, 20)
                                                HStack {
                                                    Image(systemName: "location.circle.fill")
                                                        .font(.title2)
                                                        .foregroundColor(.black)
                                                    Text(bailFund.city)
                                                        .font(.headline)
                                                        .foregroundColor(.black)
                                                    Spacer()

                                                }
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 1)
                                                HStack {
                                                    Image(systemName: "cloud")
                                                        .font(.title2)
                                                        .foregroundColor(.black)
                                                    Text(bailFund.url)
                                                        .font(.subheadline)
                                                        .fixedSize(horizontal: false, vertical: true)
                                                        .foregroundColor(.black)
                                                    Spacer()                                                }
                                                .padding(.horizontal, 20)
                                                    .padding(.bottom, index != state.bailFunds.count - 1 ? 0 : 20)

                                                //design the above

                                            }
                                            if index != state.bailFunds.count - 1 {
                                                Divider()
                                                    .padding(.bottom, 0)
                                                    .padding(.horizontal, 20)
                                            }
                                        }
                                        .padding(.top, 0)
                                }
                                .padding(.top, 5)
                                .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                            }
                            .padding(.top, 10)
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 0)
                            .padding(.bottom, 25)
                        }
                        
                        .overlay(
                            Rectangle().opacity(swiftUIModeActive ? 0.01 : 0)
                        )
                        .onTapGesture {
                            withAnimation {
                                if swiftUIModeActive {
                                    sectionViewActive = true
                                }
                            }
                        }
                        .sheet(isPresented: $sectionViewActive) {
                            VStackViewBail(view: AnyView(
                                VStack {

                                    //design the below


                                    HStack {
                                        Image(systemName: "dollarsign.circle")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                        Text("Bay Area Anti-Repression Committee Bail Fund")
                                            .font(.title2)
                                            .bold()
                                            .foregroundColor(.black)
                                        Spacer()

                                    }
                                    .padding(.horizontal, 20)
                                    HStack {
                                        Image(systemName: "location.circle.fill")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                        Text("Bay Area")
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        Spacer()

                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 1)
                                    HStack {
                                        Image(systemName: "cloud")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                        Text("https://rally.org/ARCbailfund")
                                            .font(.subheadline)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .foregroundColor(.black)
                                        Spacer()                                                }
                                    .padding(.horizontal, 20)

                                    //design the above

                                }
                            ))
                        }
                    }
                }
            }
            .padding(.bottom, 55)
            .scaleEffect(swiftUIModeActive ? 0.85 : 1)
            if swiftUIModeActive {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                app4Tapped.toggle()
                                mainViewVisible.toggle()
                                swiftUIModeActive.toggle()
                            }
                        } label: {
                            Text("Exit mini-app")
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                            Circle()
                                .foregroundColor(Color("mainColor"))
                                .frame(width: 30, height: 30)
                                .shadow(radius: 2.5, x: 2.5, y: 2.5)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                )
                                .padding(.trailing, 30)
                        }
                    }
                    Spacer()
                }
                .animation(.spring())
                .transition(.move(edge: .trailing))
            }
            ZStack {
                VStack {
                    Spacer()
                    Rectangle()
                        .frame(height: 85)
                        .foregroundColor(swiftUIModeActive ? Color(#colorLiteral(red: 0.7421307378, green: 0.9870165902, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.8656401038, green: 0.8835137486, blue: 0.9026365876, alpha: 1)))
                        .opacity(0.975)
                        .overlay(
                            HStack {
                                Spacer()
                                Text("Toggle SwiftUI Mode")
                                    .bold()
                                    .foregroundColor(.black)
                                Toggle(isOn: $swiftUIModeActive.animation()) {
                                }
                                .labelsHidden()
                                .toggleStyle(SwitchToggleStyle(tint: Color("mainColor")))
                                Spacer()
//                                    Button {
//                                        withAnimation {
//                                            swiftUIModeActive.toggle()
//                                        }
//                                    } label: {
//                                        Text("Toggle SwiftUI mode")
//                                    }
                            }
                        )
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        
    }
}

struct BailOutView_Previews: PreviewProvider {
    static var previews: some View {
        BailOutView(app4Tapped: .constant(false), mainViewVisible: .constant(false))
//        BailOutView()
    }
}

struct VStackViewBail: View {
    
    var view: AnyView 
    @State var resizableViewIsActive = false
    @State var boldViewIsActive = false
    @State var textViewIsActive = false
    @State var fontViewIsActive = false
    @State var vStackViewIsActive = false
    @State var paddingViewIsActive = false
    @State var imageViewIsActive = false
    @State var scaledToFitViewIsActive = false
    @State var clipShapeViewIsActive = false
    @State var foregroundColorViewIsActive = false
    @State var multilineViewIsActive = false
    @State var backgroundViewIsActive = false
    @State var cornerRadiusViewIsActive = false
    
    var body: some View {
        ScrollView {
            VStack {
                view
                .padding()
                .border(Color("mainColor"), width: 4)
                .padding(30)
                HStack {
                    VStack(alignment: .leading) {
                        Group {
                            Group {
                                Button {
                                    vStackViewIsActive = true
                                } label: {
                                    Text("VStack {")
                                        .bold()
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $vStackViewIsActive) {
                                    DocumentationView(documentation: documentation["vstack"]!)
                                }
                                Text("\tif cop.imageFilename != nil {")
                                    .font(.system(.body, design: .monospaced))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                Button {
                                    imageViewIsActive = true
                                } label: {
                                    Text("\t\tImage(cop.imageFilename)")
                                        .bold()
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $imageViewIsActive, onDismiss: {
                                    imageViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["image"]!)
                                }
                                Button {
                                    resizableViewIsActive = true
                                } label: {
                                    Text("\t\t\t.resizable()")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $resizableViewIsActive, onDismiss: {
                                    resizableViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["resizable"]!)
                                }
                                Button {
                                    scaledToFitViewIsActive = true
                                } label: {
                                    Text("\t\t\t.scaledToFit()")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $scaledToFitViewIsActive, onDismiss: {
                                    scaledToFitViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["scaledtofit"]!)
                                }
                                Button {
                                    clipShapeViewIsActive = true
                                } label: {
                                    Text("\t\t\t.clipShape(")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $clipShapeViewIsActive) {
                                    DocumentationView(documentation: documentation["clipshape"]!)
                                }
                                Text("\t\t\t\tRoundedRectangle(cornerRadius: 10.0)")
                                    .font(.system(.body, design: .monospaced))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                
                                Button {
                                    clipShapeViewIsActive = true
                                } label: {
                                    Text("\t\t\t)")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $clipShapeViewIsActive) {
                                    DocumentationView(documentation: documentation["clipshape"]!)
                                }
                            }
                            Text("\t} else {")
                                .font(.system(.body, design: .monospaced))
                            Group {
                                Button {
                                    vStackViewIsActive = true
                                } label: {
                                    Text("\t\tVStack {")
                                        .bold()
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $vStackViewIsActive) {
                                    DocumentationView(documentation: documentation["vstack"]!)
                                }
                                Button {
                                    imageViewIsActive = true
                                } label: {
                                    Text("\t\t\tImage(systemName: \"exclamationmark.triangle\")")
                                        .font(.system(.body, design: .monospaced))
                                        .bold()
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                                .sheet(isPresented: $imageViewIsActive, onDismiss: {
                                    imageViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["image"]!)
                                }
                                
                                Button {
                                    paddingViewIsActive = true
                                } label: {
                                    Text("\t\t\t\t.padding()")
                                        
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $paddingViewIsActive, onDismiss: {
                                    paddingViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["padding"]!)
                                }
                                
                                Button {
                                    fontViewIsActive = true
                                } label: {
                                    Text("\t\t\t\t.font(.title)")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $fontViewIsActive) {
                                    DocumentationView(documentation: documentation["font"]!)
                                }
                                Button {
                                    foregroundColorViewIsActive = true
                                } label: {
                                    Text("\t\t\t\t.foregroundColor(.white)")
                                        .font(.system(.body, design: .monospaced))
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                                .sheet(isPresented: $foregroundColorViewIsActive, onDismiss: {
                                    foregroundColorViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["foregroundColor"]!)
                                }
                            }
                            .padding(5)
                            Group {
                                Button {
                                    textViewIsActive = true
                                } label: {
                                    Text("\t\tText(\"Photo not found\")")
                                        .font(.system(.body, design: .monospaced))
                                        .bold()
                                }
                                .sheet(isPresented: $textViewIsActive) {
                                    DocumentationView(documentation: documentation["text"]!)
                                }
                                Button {
                                    fontViewIsActive = true
                                } label: {
                                    Text("\t\t\t.font(.title)")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $fontViewIsActive) {
                                    DocumentationView(documentation: documentation["font"]!)
                                }
                                
                                Button {
                                    foregroundColorViewIsActive = true
                                } label: {
                                    Text("\t\t\t.foregroundColor(.white)")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $foregroundColorViewIsActive, onDismiss: {
                                    foregroundColorViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["foregroundColor"]!)
                                }
                                
                                Button {
                                    multilineViewIsActive = true
                                } label: {
                                    Text("\t\t\t.multilineTextAlignment(.center)")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $multilineViewIsActive) {
                                    DocumentationView(documentation: documentation["font"]!)
                                }
                                
                                Text("\t\t\t.lineLimit(1)")
                                    .font(.system(.body, design: .monospaced))
                                Text("\t\t\t.minimumScaleFactor(0.4)")
                                    .font(.system(.body, design: .monospaced))
                                Button {
                                    vStackViewIsActive = true
                                } label: {
                                    Text("\t\t}")
                                        .bold()
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $vStackViewIsActive) {
                                    DocumentationView(documentation: documentation["vstack"]!)
                                }
                                
                            }
                            Group {
                                Button {
                                    paddingViewIsActive = true
                                } label: {
                                    Text("\t\t.padding()")
                                        
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $paddingViewIsActive, onDismiss: {
                                    paddingViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["padding"]!)
                                }
                                Button {
                                    backgroundViewIsActive = true
                                } label: {
                                    Text("\t\t.background(Color.gray)")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $backgroundViewIsActive, onDismiss: {
                                    backgroundViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["background"]!)
                                }
                                
                                Button {
                                    cornerRadiusViewIsActive = true
                                } label: {
                                    Text("\t\t.cornerRadius(10.0)")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $cornerRadiusViewIsActive, onDismiss: {
                                    cornerRadiusViewIsActive = false
                                }) {
                                    DocumentationView(documentation: documentation["cornerradius"]!)
                                }
                                Text("\t}")
                                Button {
                                    textViewIsActive = true
                                } label: {
                                    Text("\tText(cop.name)")
                                        .font(.system(.body, design: .monospaced))
                                        .bold()
                                }
                                .sheet(isPresented: $textViewIsActive) {
                                    DocumentationView(documentation: documentation["text"]!)
                                }
                                
                                Button {
                                    fontViewIsActive = true
                                } label: {
                                    Text("\t\t.font(.headline)")
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $fontViewIsActive) {
                                    DocumentationView(documentation: documentation["font"]!)
                                }
                                Button {
                                    vStackViewIsActive = true
                                } label: {
                                    Text("}")
                                        .bold()
                                        .font(.system(.body, design: .monospaced))
                                }
                                .sheet(isPresented: $vStackViewIsActive) {
                                    DocumentationView(documentation: documentation["vstack"]!)
                                }
                            }
                        }
                        .padding(5)
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
