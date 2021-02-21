//
//  OfficerProfileView.swift
//  HelloSwift
//
//

import SwiftUI


struct OfficerProfileView: View {
    
    var cop: Cop
    @Binding var swiftUIModeActive: Bool
    @State var imageViewIsActive = false
    @State var noImageViewIsActive = false
    @State var textViewIsActive = false
    @State var textView2IsActive = false
    @State var textView3IsActive = false
    @State var textView4IsActive = false
    @State var textView5IsActive = false
    @State var buttonViewIsActive = false
    @State var scrollViewIsActive = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        GeometryReader { gr in
            ZStack {
                ScrollView(showsIndicators: false) {
                    HStack {
                        Spacer()
                        VStack {
                            if cop.imageFilename != nil {
                                Image(cop.imageFilename!)
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                    .onTapGesture {
                                        if swiftUIModeActive {
                                            imageViewIsActive = true
                                        }
                                    }
                                    .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                                    .sheet(isPresented: $imageViewIsActive) {
                                        TopImageView(cop: cop)
                                    }
                            } else {
                                VStack {
                                    Image(systemName: "exclamationmark.triangle")
                                        .padding()
                                        .font(.title)
                                        .foregroundColor(.white)
                                    Text("Photo not found")
                                        .font(.title).foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.4)
                                        .padding()
                                }
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(10.0)
                                .padding(.top, 30)
                                .onTapGesture {
                                    if swiftUIModeActive {
                                        noImageViewIsActive = true
                                    }
                                }
                                .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                                .sheet(isPresented: $noImageViewIsActive) {
                                    NoImageView(cop: cop)
                                }
                            }
                            
                            if cop.name == "Unknown" {
                                Button {
                                    print("Image tapped!")
                                } label: {
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                        Text("Do you know who this is?")
                                    }
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(5.0)
                                }
                                .padding()
                                .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                                .disabled(swiftUIModeActive)
                                .onTapGesture {
                                    buttonViewIsActive = true
                                }
                                .sheet(isPresented: $buttonViewIsActive) {
                                    ButtonView(cop: cop, imageName: "magnifyingglass", buttonName: "Do you know who this is?")
                                }
                            }
                            VStack {
                                Text("Name")
                                    .font(.title2)
                                    .bold()
                                Text(cop.name)
                                    .font(.title)
                            }
                            .padding()
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .onTapGesture {
                                if swiftUIModeActive {
                                    textViewIsActive = true
                                }
                            }
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                            .sheet(isPresented: $textViewIsActive) {
                                TextImageView(cop: cop, title2: "Name", title: cop.name, title3: "cop.name")
                            }
                            VStack {
                                Text("Badge Number")
                                    .font(.title2)
                                    .bold()
                                Text("\(cop.badgeNumber)")
                                    .font(.title)
                            }
                            .padding()
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .onTapGesture {
                                if swiftUIModeActive {
                                    textView2IsActive = true
                                }
                            }
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                            .sheet(isPresented: $textView2IsActive) {
                                TextImageView(cop: cop, title2: "Badge Number", title: "\(cop.badgeNumber)", title3: "cop.badgeNumber")
                            }
                            VStack {
                                Text("Job Title")
                                    .font(.title2)
                                    .bold()
                                Text("\(cop.jobTitle)")
                                    .font(.title)
                            }
                            .padding()
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .onTapGesture {
                                if swiftUIModeActive {
                                    textView3IsActive = true
                                }
                            }
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                            .sheet(isPresented: $textView3IsActive) {
                                TextImageView(cop: cop, title2: "Job Title", title: cop.jobTitle, title3: "cop.jobTitle")
                            }
                            VStack {
                                Text("Department")
                                    .font(.title2)
                                    .bold()
                                Text("\(cop.department)")
                                    .font(.title)
                                
                            }
                            .padding()
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .onTapGesture {
                                if swiftUIModeActive {
                                    textView4IsActive = true
                                }
                            }
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                            .sheet(isPresented: $textView4IsActive) {
                                TextImageView(cop: cop, title2: "Department", title: cop.department, title3: "cop.department")
                            }
                            VStack {
                                Text("Gender")
                                    .font(.title2)
                                    .bold()
                                Text("\(cop.gender)")
                                    .font(.title)
                            }
                            .padding()
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .onTapGesture {
                                if swiftUIModeActive {
                                    textView5IsActive = true
                                }
                            }
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                            .sheet(isPresented: $textView5IsActive) {
                                TextImageView(cop: cop, title2: "Gender", title: cop.gender, title3: "cop.gender")
                            }
                            Button {
                                print("Image tapped!")
                            } label: {
                                HStack {
                                    Image(systemName: "exclamationmark.triangle")
                                    Text("File an incident report")
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(5.0)
                            }
                            .padding()
                            .border(swiftUIModeActive ? Color("mainColor") : Color.clear, width: 4)
                            .disabled(swiftUIModeActive)
                            .onTapGesture {
                                buttonViewIsActive = true
                            }
                            .sheet(isPresented: $buttonViewIsActive) {
                                ButtonView(cop: cop, imageName: "exclamationmark.triangle", buttonName: "File an incident report")
                            }
                        }
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 85)
                        .padding(.top, 0)
                        //                    .border(swiftUIModeActive ? Color.pink : Color.clear, width: 4)
                        .scaleEffect(swiftUIModeActive ? 0.85 : 1)
                        .offset(y: swiftUIModeActive ? -55 : 0)
                        Spacer()
                    }
                } // end of scrollview
            } //end of zstack
            .navigationBarTitleDisplayMode(.inline)
        } //end of geometry reader
        
    } //end of body
} // end of struct def

struct OfficerProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        OfficerProfileView(cop: cops[6], swiftUIModeActive: .constant(false))
            .preferredColorScheme(.dark)
    }
}

struct ButtonView: View {
    
    var cop: Cop
    var imageName: String
    var buttonName: String
    @State var buttonViewIsActive = false
    @State var hStackViewIsActive = false
    @State var imageViewIsActive = false
    @State var textViewIsActive = false
    @State var foregroundColorViewIsActive = false
    @State var paddingViewIsActive = false
    @State var backgroundViewIsActive = false
    @State var cornerRadiusViewIsActive = false
    
    var body: some View {
        VStack {
            Button {
                print("Button tapped!")
            } label: {
                HStack {
                    Image(systemName: imageName)
                    Text(buttonName)
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(5.0)
            }
            .padding()
            .border(Color("mainColor"), width: 4)
            .padding()
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Button {
                            buttonViewIsActive = true
                        } label: {
                            Text("Button {")
                                .bold()
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $buttonViewIsActive) {
                            DocumentationView(documentation: documentation["button"]!)
                        }
                        Text("\tprint(\"Button tapped!\")")
                            
                            .font(.system(.body, design: .monospaced))
                        Text("} label: {")
                            
                            .font(.system(.body, design: .monospaced))
                        Button {
                            hStackViewIsActive = true
                        } label: {
                            Text("\tHStack {")
                                .bold()
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $hStackViewIsActive) {
                            DocumentationView(documentation: documentation["hstack"]!)
                        }
                        Button {
                            imageViewIsActive = true
                        } label: {
                            Text("\t\tImage(\(imageName))")
                                .bold()
                                
                                .font(.system(.body, design: .monospaced))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            //                                .multilineTextAlignment(.leading)
                        }
                        .sheet(isPresented: $imageViewIsActive) {
                            DocumentationView(documentation: documentation["image"]!)
                        }
                        Button {
                            textViewIsActive = true
                        } label: {
                            Text("\t\tText(\"\(buttonName)\")")
                                .bold()
                                
                                .font(.system(.body, design: .monospaced))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                        .sheet(isPresented: $textViewIsActive, onDismiss: {
                            textViewIsActive = false
                        }) {
                            DocumentationView(documentation: documentation["text"]!)
                        }
                        Button {
                            hStackViewIsActive = true
                        } label: {
                            Text("\t}")
                                .bold()
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $hStackViewIsActive) {
                            DocumentationView(documentation: documentation["hstack"]!)
                        }
                        Group {
                            Button {
                                foregroundColorViewIsActive = true
                            } label: {
                                Text("\t.foregroundColor(.white)")
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $foregroundColorViewIsActive, onDismiss: {
                                foregroundColorViewIsActive = false
                            }) {
                                DocumentationView(documentation: documentation["foregroundColor"]!)
                            }
                            Button {
                                paddingViewIsActive = true
                            } label: {
                                Text("\t.padding()")
                                    
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
                                Text("\t.background(Color.blue)")
                                    
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
                                Text("\t.cornerRadius(10.0)")
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $cornerRadiusViewIsActive, onDismiss: {
                                cornerRadiusViewIsActive = false
                            }) {
                                DocumentationView(documentation: documentation["cornerradius"]!)
                            }
                            
                            Button {
                                buttonViewIsActive = true
                            } label: {
                                Text("}")
                                    .bold()
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $buttonViewIsActive) {
                                DocumentationView(documentation: documentation["button"]!)
                            }
                            Button {
                                paddingViewIsActive = true
                            } label: {
                                Text(".padding()")
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $paddingViewIsActive, onDismiss: {
                                paddingViewIsActive = false
                            }) {
                                DocumentationView(documentation: documentation["padding"]!)
                            }
                        }
                        
                    }
                    .padding(10)
                    
                }
                .padding(.horizontal)
                Spacer()
            }
            Spacer()
        }
    }
    
}


struct TextImageView: View {
    
    var cop: Cop
    var title2: String
    var title: String
    var title3: String
    @State var resizableViewIsActive = false
    @State var boldViewIsActive = false
    @State var textViewIsActive = false
    @State var fontViewIsActive = false
    @State var vStackViewIsActive = false
    @State var paddingViewIsActive = false
    
    var body: some View {
        VStack {
            VStack {
                Text(title2)
                    .font(.title2)
                    .bold()
                Text(title)
                    .font(.title)
            }
            .padding()
            .border(Color("mainColor"), width: 4)
            .padding(30)
            HStack {
                VStack(alignment: .leading) {
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
                        Button {
                            textViewIsActive = true
                        } label: {
                            Text("\tText(\"\(title2)\")")
                                .bold()
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $textViewIsActive, onDismiss: {
                            textViewIsActive = false
                        }) {
                            DocumentationView(documentation: documentation["text"]!)
                        }
                        Button {
                            fontViewIsActive = true
                        } label: {
                            Text("\t\t.font(.title2)")
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $fontViewIsActive) {
                            DocumentationView(documentation: documentation["font"]!)
                        }
                        Button {
                            boldViewIsActive = true
                        } label: {
                            Text("\t\t.bold()")
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $boldViewIsActive, onDismiss: {
                            boldViewIsActive = false
                        }) {
                            DocumentationView(documentation: documentation["bold"]!)
                        }
                        Button {
                            textViewIsActive = true
                        } label: {
                            Text("\tText(\(title3))")
                                .bold()
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $textViewIsActive, onDismiss: {
                            textViewIsActive = false
                        }) {
                            DocumentationView(documentation: documentation["text"]!)
                        }
                        Button {
                            fontViewIsActive = true
                        } label: {
                            Text("\t\t.font(.title)")
                                
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
                        Button {
                            paddingViewIsActive = true
                        } label: {
                            Text(".padding()")
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $paddingViewIsActive, onDismiss: {
                            paddingViewIsActive = false
                        }) {
                            DocumentationView(documentation: documentation["padding"]!)
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

struct TopImageView: View {
    
    
    var cop: Cop
    @State var resizableViewIsActive = false
    @State var scaledToFitViewIsActive = false
    @State var imageViewIsActive = false
    @State var paddingViewIsActive = false
    
    var body: some View {
        VStack {
            Image(cop.imageFilename!)
                .resizable()
                .scaledToFit()
                .padding()
                .border(Color("mainColor"), width: 4)
                .padding()
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Button {
                            imageViewIsActive = true
                        } label: {
                            Text("Image(cop.imageFilename)")
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
                            Text("\t.resizable()")
                                
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
                            Text("\t.scaledToFit()")
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $scaledToFitViewIsActive, onDismiss: {
                            scaledToFitViewIsActive = false
                        }) {
                            DocumentationView(documentation: documentation["scaledtofit"]!)
                        }
                        Button {
                            paddingViewIsActive = true
                        } label: {
                            Text("\t.padding()")
                                
                                .font(.system(.body, design: .monospaced))
                        }
                        .sheet(isPresented: $paddingViewIsActive, onDismiss: {
                            paddingViewIsActive = false
                        }) {
                            DocumentationView(documentation: documentation["padding"]!)
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

struct NoImageView: View {
    
    var cop: Cop
    @State var vStackViewIsActive = false
    @State var fontViewIsActive = false
    @State var foregroundColorViewIsActive = false
    @State var textViewIsActive = false
    @State var multilineViewIsActive = false
    @State var imageViewIsActive = false
    @State var paddingViewIsActive = false
    @State var backgroundViewIsActive = false
    @State var cornerRadiusViewIsActive = false
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Photo not found")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(10.0)
                .padding(.top, 30)
                .border(Color("mainColor"), width: 4)
                .padding()
                HStack {
                    VStack(alignment: .leading) {
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
                            Button {
                                imageViewIsActive = true
                            } label: {
                                Text("\tImage(systemName: \"exclamationmark.triangle\")")
                                    
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
                                Text("\t\t.padding()")
                                    
                                    
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
                                Text("\t\t.font(.title)")
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $fontViewIsActive) {
                                DocumentationView(documentation: documentation["font"]!)
                            }
                            Button {
                                foregroundColorViewIsActive = true
                            } label: {
                                Text("\t\t.foregroundColor(.white)")
                                    
                                    .font(.system(.body, design: .monospaced))
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
                                Text("\tText(\"Photo not found\")")
                                    
                                    .font(.system(.body, design: .monospaced))
                                    .bold()
                            }
                            .sheet(isPresented: $textViewIsActive) {
                                DocumentationView(documentation: documentation["text"]!)
                            }
                            Button {
                                fontViewIsActive = true
                            } label: {
                                Text("\t\t.font(.title)")
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $fontViewIsActive) {
                                DocumentationView(documentation: documentation["font"]!)
                            }
                            
                            Button {
                                foregroundColorViewIsActive = true
                            } label: {
                                Text("\t\t.foregroundColor(.white)")
                                    
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
                                Text("\t\t.multilineTextAlignment(.center)")
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $multilineViewIsActive) {
                                DocumentationView(documentation: documentation["font"]!)
                            }
                            
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
                        .padding(5)
                        Group {
                            
                            Button {
                                paddingViewIsActive = true
                            } label: {
                                Text(".padding()")
                                    
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
                                Text(".background(Color.gray)")
                                    
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
                                Text(".cornerRadius(10.0)")
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $cornerRadiusViewIsActive, onDismiss: {
                                cornerRadiusViewIsActive = false
                            }) {
                                DocumentationView(documentation: documentation["cornerradius"]!)
                            }
                            
                            Button {
                                paddingViewIsActive = true
                            } label: {
                                Text(".padding(.top, 30)")
                                    
                                    .font(.system(.body, design: .monospaced))
                            }
                            .sheet(isPresented: $paddingViewIsActive, onDismiss: {
                                paddingViewIsActive = false
                            }) {
                                DocumentationView(documentation: documentation["padding"]!)
                            }
                            
                        }
                        .padding(5)
                    }
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 30)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
