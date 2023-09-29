//
//  OrientationLockModifier.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/29/23.
//

import SwiftUI

struct OrientationLockModifier: ViewModifier {
    let lockOrientation: UIInterfaceOrientationMask
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                AppDelegate.orientationLock = lockOrientation
            }
            .onDisappear {
                AppDelegate.orientationLock = .all // allows full Rotating functionality 
            }
    }
}
