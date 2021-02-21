//
//  refugeBRView.swift
//  HelloSwift
//
//

import SwiftUI

struct RefugeBRView: View {
    
    @State var swiftUIModeActive = false
    @State var hStackViewActive = false 
    @Binding var app3Tapped: Bool
    @Binding var mainViewVisible: Bool
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(showsIndicators: false) {
                    ForEach(0..<restrooms.count) { theme in
                    //List(0..<restrooms.count) { theme in
                        NavigationLink(destination: RefugeBRDetailView(swiftUIModeActive: $swiftUIModeActive, restroom: restrooms[theme]).padding(.bottom, -15)) {
                        if theme % 2 == 0 {
                            HStack {
                                Text(restrooms[theme].name)
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "staroflife.circle")
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6022030094, blue: 0.716258733, alpha: 1)))
                                    .font(.title)

                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3)
                                    .foregroundColor(Color(#colorLiteral(red: 0.003145358991, green: 0.08754394203, blue: 0.5761563778, alpha: 1))).padding(1) .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4))
                            .sheet(isPresented: $hStackViewActive) {
                                HStackViewHaven(title: "Pita Pit")
                            }
                        } else {
                            HStack {
                                Text(restrooms[theme].name)
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "staroflife.circle.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6022030094, blue: 0.716258733, alpha: 1)))
                                    .font(.title)
                            }
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3)
                                    .foregroundColor(Color(#colorLiteral(red: 0.003145358991, green: 0.08754394203, blue: 0.5761563778, alpha: 1))).padding(1)                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4))

                            }
                        }
                        .padding()
                        .disabled(swiftUIModeActive)
                        .onTapGesture {
                            if swiftUIModeActive {
                                hStackViewActive = true
                            }
                        }
                        .navigationTitle("Havens")
                        
                    }
                }
                .padding()
                //.fixedSize(horizontal: false, vertical: true)
                //.foregroundColor(.black)

            }
            .padding(.bottom, 35)
            .scaleEffect(swiftUIModeActive ? 0.85 : 1)
            if swiftUIModeActive {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                app3Tapped.toggle()
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

struct RefugeBRView_Previews: PreviewProvider {
    static var previews: some View {
        RefugeBRView(app3Tapped: .constant(true), mainViewVisible: .constant(false))
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct HStackViewHaven: View {
    
    var title: String
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
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    Image(systemName: "staroflife.circle")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6022030094, blue: 0.716258733, alpha: 1)))
                        .font(.title)

                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3)
                        .foregroundColor(Color(#colorLiteral(red: 0.003145358991, green: 0.08754394203, blue: 0.5761563778, alpha: 1))).padding(1)
                )
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
                                    Text("\t\t\tImage(\n\t\t\t\tsystemName: \"exclamationmark.triangle\")")
                                        .font(.system(.body, design: .monospaced))
                                        .bold()
                                        .lineLimit(2)
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
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
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

struct VStackViewHaven: View {
    
    var title: String
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
                VStack {
                    view
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
