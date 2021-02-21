//
//  DocumentationView.swift
//  HelloSwift
//
//

import SwiftUI

struct DocumentationView: View {
    
    var documentation: Documentation
    @State var descriptionVisible = false
    @State var declarationVisible = false
    @State var overviewVisible = false
    @State var parametersVisible = false
    @State var figuresVisible = false
    @State var expanded = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Group {
                        Text(documentation.category)
                            .font(.title2)
                            .foregroundColor(.gray)
                        Text(documentation.name)
                            .font(.title)
                            .bold()
                    }
                    Divider()
                    HStack {
                        Spacer()
                        if expanded {
                            Button {
                                withAnimation {
                                    expanded.toggle()
                                    descriptionVisible = false
                                    declarationVisible = false
                                    overviewVisible = false
                                    parametersVisible = false
                                    figuresVisible = false
                                }
                            } label: {
                                HStack {
                                    Text("Collapse all")
                                        .bold()
                                }
                        }
                        } else {
                            Button {
                                withAnimation {
                                    expanded.toggle()
                                    descriptionVisible = true
                                    declarationVisible = true
                                    overviewVisible = true
                                    parametersVisible = true
                                    figuresVisible = true
                                }
                            } label: {
                                HStack {
                                    Text("Expand all")
                                        .bold()
                                }
                            }
                        }
                    }
                    Group {
                        Button {
                            withAnimation {
                                descriptionVisible.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: descriptionVisible ? "chevron.right.square.fill" : "chevron.right.square")
                                    .foregroundColor(Color("mainColor"))
                                    .font(.title3)
                                    .rotationEffect(.init(degrees: descriptionVisible ? 90 : 0 ))
                                Text("Description")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }
                        if descriptionVisible {
                            VStack {
                                Text(documentation.description)
                            }
                            .animation(.easeInOut)
                            Divider()
                        }
                    }
                    Group {
                        Button {
                            withAnimation {
                                declarationVisible.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: declarationVisible ? "chevron.right.square.fill" : "chevron.right.square")
                                    .foregroundColor(Color("mainColor"))
                                    .font(.title3)
                                    .rotationEffect(.init(degrees: declarationVisible ? 90 : 0 ))
                                Text("Declaration")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }
                        if declarationVisible {
                            VStack {
                                Text(documentation.declaration)
                                    .italic()
                            }
                            .animation(.easeInOut)
                            Divider()
                        }
                    }

                    Group {
                        Button {
                            withAnimation {
                                overviewVisible.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: overviewVisible ? "chevron.right.square.fill" : "chevron.right.square")
                                    .foregroundColor(Color("mainColor"))
                                    .font(.title3)
                                    .rotationEffect(.init(degrees: overviewVisible ? 90 : 0 ))
                                Text("Overview")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }
                        if overviewVisible {
                            VStack {
                                Text(documentation.overview)
                            }
                            .animation(.easeInOut)
                            Divider()
                        }
                    }
                    if documentation.parameters != nil {
                        
                        Group {
                            Button {
                                withAnimation {
                                    parametersVisible.toggle()
                                }
                            } label: {
                                HStack {
                                    Image(systemName: parametersVisible ? "chevron.right.square.fill" : "chevron.right.square")
                                        .foregroundColor(Color("mainColor"))
                                        .font(.title3)
                                        .rotationEffect(.init(degrees: parametersVisible ? 90 : 0 ))
                                    Text("Parameters")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)

                                }
                            }
                            if parametersVisible {
                                ForEach(0..<documentation.parameters!.count) { index in
                                    Text(documentation.parameters![index].0)
                                        .italic()
                                    Text(documentation.parameters![index].1)
                                }
                                .animation(.easeInOut)
                                Divider()
                            }
                        }
                    }
                    if documentation.imageFilenames != nil {
                        Group {
                            Button {
                                withAnimation {
                                    figuresVisible.toggle()
                                }
                            } label: {
                                HStack {
                                    Image(systemName: figuresVisible ? "chevron.right.square.fill" : "chevron.right.square")
                                        .foregroundColor(Color("mainColor"))
                                        .font(.title3)
                                        .rotationEffect(.init(degrees: figuresVisible ? 90 : 0 ))
                                    Text("Figures")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                            }
                            if figuresVisible {
                                ForEach(0..<documentation.imageFilenames!.count) { index in
                                    VStack(alignment: .leading) {
                                        Text("Figure \(index + 1)")
                                            .italic()
                                        Image(documentation.imageFilenames![index])
                                            .resizable()
                                            .scaledToFit()
                                            .padding()
                                    }
                                }
                                .animation(.easeInOut)
                                Divider()
                            }

                        }
                        
                    }
                }
                .padding(15)
                .padding(.horizontal, 15)
                .multilineTextAlignment(.leading)
            }
            .padding(.vertical)
        }
    }
}

struct DocumentationView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationView(documentation: documentation["resizable"]!)
        DocumentationView(documentation: documentation["image"]!)
        DocumentationView(documentation: documentation["text"]!)
    }
}
