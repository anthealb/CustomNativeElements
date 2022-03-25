//
//  CustomSegmentedControl.swift
//  CustomNativeElement
//
//  Created by Anthea Lavinia Bove on 25/03/22.
//

import SwiftUI
import UIKit

// This View creates a native Segmented Control which is easily and completely customizable when it comes to colors and font, and can be called as a View in any SwiftUI app. It allows you to choose which parameter you want to customize. The others remain the default system standard
struct CustomSegmentedControl: UIViewRepresentable {
    typealias UIViewType = UISegmentedControl
    
    let myItems: [String]!                              // a list of string labels
    var backgroundColor: CGColor? = nil                 // your custom color for the Segmented Control's background
    var textColor: CGColor? = nil                       // your custom color for the Segmented Control's text
    var selectedSegmentColor: CGColor? = nil            // your custom color for the Segmented Control's selected segment background
    var selectedSegmentTextColor: CGColor? = nil        // your custom color for the Segmented Control's selected segment text
    var myFont: UIFont? = UIFont.systemFont(ofSize: 14) // your custom font
    @Binding var selected: Int                          // the variable you want to bind to the "selected" status
    
    func makeUIView(context: Context) -> UISegmentedControl {
        // creates a standard UISegmentedControl with your list of labels and selects one element
        let control = UISegmentedControl(items: myItems)
        control.selectedSegmentIndex = selected
        
        // adds an action that updates the value of "selected" everytime you touch a segment
        let action = UIAction { _ in
            self.selected = control.selectedSegmentIndex
        }
        control.addAction(action, for: .valueChanged)
        
        // clearImage is useful for a workwround that allows to completely customize the background
        let clearImage = UIImage(color: .clear, size: CGSize(width: 1, height: myFont!.capHeight*1.8))
        
        // backgrounds customization:
        // if you gave an input backgroundColor, sets it as the background for the segmented control
        // then also changes the background color for the selected segment with the same workaround if necessary
        // otherwise it just applies your custom background color for the selected segment if chosen
        if backgroundColor != nil {
            control.setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
            control.backgroundColor = UIColor(cgColor: backgroundColor!)
            control.layer.borderWidth = myFont!.capHeight*0.2
            control.layer.borderColor = backgroundColor
            
            let uiSelectedSegmentColor: UIColor!
            if selectedSegmentColor != nil {
                uiSelectedSegmentColor = UIColor(cgColor: selectedSegmentColor!)
            } else {
                uiSelectedSegmentColor = UIColor.systemBackground
            }
            
            let selectedImage = UIImage(color: uiSelectedSegmentColor, size: CGSize(width: 1, height: 1))
            control.selectedSegmentTintColor = uiSelectedSegmentColor
            control.setBackgroundImage(selectedImage, for: .selected, barMetrics: .default)
        } else {
            if selectedSegmentColor != nil {
                control.selectedSegmentTintColor = UIColor(cgColor: selectedSegmentColor!)
            }
        }
        
        // text color  and font customisation for nomal state
        if textColor != nil {
            let uiTextColor = UIColor(cgColor: textColor!)
            control.setTitleTextAttributes([.foregroundColor: uiTextColor, .font : myFont!], for: .normal)
        } else {
            control.setTitleTextAttributes([.font : myFont!], for: .normal)
        }
        
        // text color and font customisation for selected state
        if selectedSegmentTextColor != nil {
            let uiSelectedSegmentTextColor = UIColor(cgColor: selectedSegmentTextColor!)
            control.setTitleTextAttributes([.foregroundColor: uiSelectedSegmentTextColor, .font : myFont!], for: .selected)
        } else {
            control.setTitleTextAttributes([.font : myFont!], for: .selected)
        }
        
        return control
    }
    
    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        // clearImage is useful for a workwround that allows to completely customize the background
        let clearImage = UIImage(color: .clear, size: CGSize(width: 1, height: myFont!.capHeight*1.8))
        
        // backgrounds customization:
        // if you gave an input backgroundColor, sets it as the background for the segmented control
        // then also changes the background color for the selected segment with the same workaround if necessary
        // otherwise it just applies your custom background color for the selected segment if chosen
        if backgroundColor != nil {
            uiView.setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
            uiView.backgroundColor = UIColor(cgColor: backgroundColor!)
            uiView.layer.borderWidth = myFont!.capHeight*0.2
            uiView.layer.borderColor = backgroundColor
            
            let uiSelectedSegmentColor: UIColor!
            if selectedSegmentColor != nil {
                uiSelectedSegmentColor = UIColor(cgColor: selectedSegmentColor!)
            } else {
                uiSelectedSegmentColor = UIColor.systemBackground
            }
            
            let selectedImage = UIImage(color: uiSelectedSegmentColor, size: CGSize(width: 1, height: 1))
            uiView.selectedSegmentTintColor = uiSelectedSegmentColor
            uiView.setBackgroundImage(selectedImage, for: .selected, barMetrics: .default)
        } else {
            uiView.setBackgroundImage(.none, for: .normal, barMetrics: .default)
            uiView.backgroundColor = UIColor.systemBackground
            uiView.layer.borderWidth = 0
            if selectedSegmentColor != nil {
                uiView.selectedSegmentTintColor = UIColor(cgColor: selectedSegmentColor!)
            } else {
                uiView.selectedSegmentTintColor = UIColor.systemBackground
            }
        }
        
        // text color  and font customisation for nomal state
        if textColor != nil {
            let uiTextColor = UIColor(cgColor: textColor!)
            uiView.setTitleTextAttributes([.foregroundColor: uiTextColor, .font : myFont!], for: .normal)
        } else {
            uiView.setTitleTextAttributes([.font : myFont!], for: .normal)
        }
        
        // text color and font customisation for selected state
        if selectedSegmentTextColor != nil {
            let uiSelectedSegmentTextColor = UIColor(cgColor: selectedSegmentTextColor!)
            uiView.setTitleTextAttributes([.foregroundColor: uiSelectedSegmentTextColor, .font : myFont!], for: .selected)
        } else {
            uiView.setTitleTextAttributes([.font : myFont!], for: .selected)
        }
    }
}


// this extension of UIImage creates a simple 1x1 image with the color fill of your choise. used for the background workaround
extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
        color.setFill()
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
