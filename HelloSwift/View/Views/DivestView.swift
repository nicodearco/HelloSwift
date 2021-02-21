//
//  DivestView.swift
//  HelloSwift
//
//

import SwiftUI
import MapKit

struct DivestView: View {
    

    @State var swiftUIModeActive = false
    @State var detailViewActive = false
    @State var hStackViewActive = false
    @Binding var app2Tapped: Bool
    @Binding var mainViewVisible: Bool
    

    var body: some View {
        GeometryReader { gr in
            ZStack {
                NavigationView {
                    List(locations) { location in
                        ZStack {
                            NavigationLink(destination: DetailView(location: location, swiftUIModeActive: $swiftUIModeActive, region:  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))) {
                                HStack {
                                    Image(systemName: "books.vertical")
                                    Text(location.name)
                                        .font(.title3)
                                        .bold()
                                }
                                .padding()
                                .sheet(isPresented: $hStackViewActive) {
                                    HStackView(location: location)
                                }
                            }
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                            .disabled(swiftUIModeActive)
                            if swiftUIModeActive {
                                Rectangle()
                                    .opacity(swiftUIModeActive ? 0.1 : 0)
                                    .onTapGesture {
                                        hStackViewActive.toggle()
                                }
                            }
                        }
                    }
                    .navigationTitle("University Fossil Fuel Divestment")
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
                .padding(.bottom, 55)
                .scaleEffect(swiftUIModeActive ? 0.85 : 1)
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
                if swiftUIModeActive {
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                withAnimation {
                                    app2Tapped.toggle()
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
            }
        }
    }
}

struct DivestView_Previews: PreviewProvider {
    static var previews: some View {
        DivestView(app2Tapped: .constant(true), mainViewVisible: .constant(false))
    }
}

struct MapView: View {
    
    var text: String
    
    var body: some View {
        VStack {
            Text("\(text)")
        }
    }
}

struct DetailView: View {
    
    var location: Location
    @State var mapViewActive = false
    @Binding var swiftUIModeActive: Bool
    
    @State var region: MKCoordinateRegion
    
    var body: some View {
        GeometryReader { gr in
            VStack {
                Map(coordinateRegion: $region, annotationItems: locations) {
                    MapAnnotation(coordinate: $0.coordinate, anchorPoint: CGPoint(x: 0.6, y: 0.6)) {
                        ZStack {
                            Capsule()
                                .offset(y: 7)
                                .frame(width: 5)
                                .foregroundColor(Color("mainColor"))
                            RoundedRectangle(cornerRadius: 5.0)
                                .foregroundColor(Color("mainColor"))
                                .frame(width: 22, height: 22)
                                .overlay(
                                    ZStack {
                                        Image(systemName: "drop.fill")
                                            .resizable()
                                            .rotationEffect(.init(degrees: 180))
                                            .frame(width: 10, height: 14)
                                            .foregroundColor(.white)

                                        Circle()
                                            .frame(width: 4, height: 4)
                                            .offset(y: -2)
                                            .foregroundColor(Color("mainColor"))
                                    }

                                )
                        }
                    }
                }
                .frame(height: gr.size.width)
                .overlay(
                    Rectangle()
                        .opacity(swiftUIModeActive ? 0.1 : 0)
                        .onTapGesture {
                            withAnimation {
                                mapViewActive.toggle()
                            }
                        }
                        .sheet(isPresented: $mapViewActive) {
                            TheMapView()
                        }
                )
                .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                ScrollView {
                    VStack {
                        Text(location.name)
                            .font(.title)
                            .bold()
                            .padding(.top, 40)
                            .padding(.horizontal, 40)
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                        Text(location.description)
                            .font(.title3)
                            .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .padding(.top, 40)
                            .padding(.horizontal, 40)
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                    }
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}


struct HStackView: View {
    
    var location: Location
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
                    Image(systemName: "books.vertical")
                    Text(location.name)
                        .font(.title3)
                        .bold()
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

struct TheMapView: View {
    
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
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.826859721390484, longitude: -71.40298808441513), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    var body: some View {
        GeometryReader { gr in
            ScrollView {
                VStack {
                    Map(coordinateRegion: $region, annotationItems: locations) {
                        MapAnnotation(coordinate: $0.coordinate, anchorPoint: CGPoint(x: 0.6, y: 0.6)) {
                            ZStack {
                                Capsule()
                                    .offset(y: 7)
                                    .frame(width: 5)
                                    .foregroundColor(Color("mainColor"))
                                RoundedRectangle(cornerRadius: 5.0)
                                    .foregroundColor(Color("mainColor"))
                                    .frame(width: 22, height: 22)
                                    .overlay(
                                        ZStack {
                                            Image(systemName: "drop.fill")
                                                .resizable()
                                                .rotationEffect(.init(degrees: 180))
                                                .frame(width: 10, height: 14)
                                                .foregroundColor(.white)

                                            Circle()
                                                .frame(width: 4, height: 4)
                                                .offset(y: -2)
                                                .foregroundColor(Color("mainColor"))
                                        }

                                    )
                            }
                        }
                    }
                    .frame(height: gr.size.width)
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
}

