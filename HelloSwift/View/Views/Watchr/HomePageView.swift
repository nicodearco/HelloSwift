//
//  HomePageView.swift
//  HelloSwift
//
//

import SwiftUI

struct HomePageView: View {
    
    @Binding var app1Tapped: Bool
    @Binding var mainViewVisible: Bool
    
    @State var swiftUIModeActive = false
    @State var navViewActive = false
    @State var vStackViewIsActive = false
    
    var body: some View {
        GeometryReader { gr in
            ZStack {
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(cops) { cop in
                                NavigationLink(destination: OfficerProfileView(cop: cop, swiftUIModeActive: $swiftUIModeActive)) {
                                    VStack {
                                        if cop.imageFilename != nil {
                                            Image(cop.imageFilename!)
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                                .frame(width: gr.size.width / 2 - 40, height: gr.size.width / 2 - 40)
                                        } else {
                                            VStack {
                                                Image(systemName: "exclamationmark.triangle")
                                                    .padding()
                                                    .font(.title)
                                                    .foregroundColor(.white)
                                                Text("Photo not found")
                                                    .font(.system(.body, design: .monospaced)).foregroundColor(.white)
                                                    .multilineTextAlignment(.center)
                                                    .lineLimit(1)
                                                    .minimumScaleFactor(0.4)
                                            }
                                            .frame(width: gr.size.width / 2 - 60, height: gr.size.width / 2 - 60)
                                            .padding(10)
                                            .background(Color.gray)
                                            .cornerRadius(10.0)
                                            
                                        }
                                        Text("\(cop.name)")
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                    }
                                    .padding()
                                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                                    
                                }
                                .disabled(swiftUIModeActive)
                                .onTapGesture {
                                    if swiftUIModeActive {
                                        vStackViewIsActive = true
                                    }
                                }
                                .sheet(isPresented: $vStackViewIsActive) {
                                    VStackView(cop: cop)
                                }
                            }
                        }
                    }
                    .navigationTitle("Oakland Police Dept.")
                    .scaleEffect(swiftUIModeActive ? 0.85 : 1)
                }
//                .overlay(
//                    VStack {
//                        Text("")
//                            .frame(width: gr.size.width - 4, height: 100)
//                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
//                        Spacer()
//                    }
//                    .onTapGesture {
//                        navViewActive = true
//                    }
//                    .sheet(isPresented: $navViewActive) {
//
//                    }
//                )
                if swiftUIModeActive {
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                withAnimation {
                                    app1Tapped.toggle()
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
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(app1Tapped: .constant(false), mainViewVisible: .constant(true))
            .previewDevice("iPhone 11")
//        HomePageView(app1Tapped: .constant(false))
//            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
//        HomePageView(app1Tapped: .constant(false))
//            .previewDevice("iPad Air (4th generation)")
//            .previewLayout(.fixed(width: 1024, height: 768))
    }
}

struct VStackView: View {
    
    var cop: Cop
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
                VStack {
                    if cop.imageFilename != nil {
                        Image(cop.imageFilename!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    } else {
                        VStack {
                            Image(systemName: "exclamationmark.triangle")
                                .padding()
                                .font(.title)
                                .foregroundColor(.white)
                            Text("Photo not found")
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .minimumScaleFactor(0.4)
                        }
                        .padding(10)
                        .background(Color.gray)
                        .cornerRadius(10.0)
                        
                    }
                    Text("\(cop.name)")
                        .font(.headline)
                }
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
