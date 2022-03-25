//
//  ContentView.swift
//  CustomNativeElement
//
//  Created by Anthea Lavinia Bove on 25/03/22.
//

import SwiftUI

struct ContentView: View {
    let pages = ["One", "Two", "Three"]
    @State var selected = 0
    
    @State var segConBackgroundColor: CGColor = UIColor.clear.cgColor
    @State var segConTextColor: CGColor = UIColor.clear.cgColor
    @State var segConSelectedSegmentColor: CGColor = UIColor.clear.cgColor
    @State var segConSelectedSegmentTextColor: CGColor = UIColor.clear.cgColor
    
    let allFontNames = UIFont.familyNames
    @State var fontIndex = Int.min
    
    @State var segConFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    // call to the custom segmented control
                    CustomSegmentedControl(myItems: pages,
                                           backgroundColor: returnColor(segConBackgroundColor),
                                           textColor: returnColor(segConTextColor),
                                           selectedSegmentColor: returnColor(segConSelectedSegmentColor),
                                           selectedSegmentTextColor: returnColor(segConSelectedSegmentTextColor),
                                           myFont: returnFont(fontIndex),
                                           selected: $selected)
                    Text("You selected the segment of index \(selected).")
                        .padding()
                }
                
                // all the pickers for the colors
                VStack {
                    Text("Edit Colors").font(.title2).bold()
                    ColorPicker("Background", selection: $segConBackgroundColor, supportsOpacity: true)
                        .padding(.top)
                    ColorPicker("Selected Segment", selection: $segConSelectedSegmentColor, supportsOpacity: true)
                    ColorPicker("Text", selection: $segConTextColor, supportsOpacity: true)
                    ColorPicker("Selected Segment Text", selection: $segConSelectedSegmentTextColor, supportsOpacity: true)
                    Button(action:{
                        updateValue($segConBackgroundColor)
                        updateValue($segConSelectedSegmentColor)
                        updateValue($segConTextColor)
                        updateValue($segConSelectedSegmentTextColor)
                    }, label: {
                        Text("Reset Colors")
                            .font(.title3)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    })
                        .padding()
                        .buttonStyle(.borderedProminent)
                }
                .padding(.top, UIScreen.main.bounds.height*0.1)
            }
            .padding()
            .navigationTitle(Text("Custom Segmented Control"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func returnColor(_ color: CGColor) -> CGColor? {
        if color == UIColor.clear.cgColor {
            return nil
        } else {
            return color
        }
    }
    
    func returnFont(_ font: Int, size s: CGFloat = 14.0) -> UIFont? {
        if font == Int.min {
            return UIFont.systemFont(ofSize: s)
        }
        return UIFont.init(name: allFontNames[font], size: s) ?? UIFont.systemFont(ofSize: s)
    }
    
    func updateValue(_ color: Binding<CGColor>) {
        color.wrappedValue = UIColor.clear.cgColor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
