//
//  StockScannerApp.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/8/23.
//

import SwiftUI
import FirebaseCore

@main
struct StockScannerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all //By default all views rotate freely
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    //Fire Base Configuration
    func application(_ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       FirebaseApp.configure()
       return true
     }
}


/*
 MARK: Summary
 1. Dont go below 30 for the prefix its a weird glitch, it'll mess up background
 2. uncomment Init() to see data we
 
 TODO: Complete these
 0.
 1. Clean up code
 2  Display Float
 3. For Reg and login get authentication UI finished
 4. Custom Coloring for scan columns
 
 */




/*

 
 Adding functions inside SwiftUI Elements:
 
  .background (
      RoundedRectangle(cornerRadius: 10)
          .fill(Color(.systemGray6))
          //.padding(.top, calculateTopPadding(prefixNum))
          .frame(maxWidth: .infinity )
         // .frame(minHeight: calculateMinHeight(prefixNum))
          .shadow(color: Color(.systemGreen).opacity(0.2), radius: 10, x: 0, y: 10)
          
  )
  
  
  func calculateTopPadding(_ prefixNum: Int) -> CGFloat? {
      let paddingValues: [Int: CGFloat] = [
          5: isLandscape ? 60 : 90,
          10: isLandscape ? 90 : 120,
          20: 40
      ]
      return paddingValues[prefixNum] ?? nil
  }
  
 
 */
