//
//  LockRotationView.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/29/23.
//
// we will  try and implement something like this on the screen window, not 100% sure yet 
import SwiftUI

struct LockRotationViewModifier<Content: View>: View {
    @State private var currentOrientation = UIDevice.current.orientation
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
          self.content = content()
      }
    
    var body: some View {
        content
            .rotationEffect(rotationAngle(currentOrientation), anchor: .center)
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                    currentOrientation = UIDevice.current.orientation
                }
            }
    }
    
    private func rotationAngle(_ orientation: UIDeviceOrientation) -> Angle {
        switch orientation {
        case .landscapeLeft:
            return .degrees(-90)
        case .landscapeRight:
            return .degrees(90)
        case .portraitUpsideDown:
            return .degrees(90)
        default:
            return .degrees(0)
        }
    }
}
