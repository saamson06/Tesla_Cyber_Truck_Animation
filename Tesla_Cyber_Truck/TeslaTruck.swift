//
//  TeslaTruck.swift
//  Tesla_Cyber_Truck
//
//  Created by Samson Lawrence on 2021-05-26.
//

import SwiftUI

struct TeslaTruck: View {
    @State var trimSize:CGFloat = 0.1
    
    let width = 120
    let height = 120
    
    var body: some View {
        ZStack
        {
            TeslaTruckShape().trim(from: 0.0, to: trimSize).stroke(lineWidth: 4).foregroundColor(.black).frame(width: 2532 / 3.0, height: 1170 / 3.0, alignment: .center).background(Color.white)

        }.edgesIgnoringSafeArea(.trailing)        .animation(.easeOut).onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: TimeInterval(0.3), repeats: true) { (tim) in
                trimSize = trimSize + 0.025
            }
        })
    }
}

struct TeslaTruckShape: Shape {
    // 1.
    
    func path(in rect: CGRect) -> Path {
        let midX = rect.midX
        let midY = rect.midY
        
        let width = rect.width
        let height = rect.height

        return Path { path in
            path.move(to: CGPoint(x: midX - 160, y: height - 80))
            path.addLine(to: CGPoint(x: width - 260, y: height - 80))
            
            // Left Wheels
            path.addRoundedRect(in: CGRect(x: 100, y: height - 160, width: 160.00, height: 160.00), cornerSize: CGSize(width: 120, height: 120))
                        
            path.addRoundedRect(in: CGRect(x: 140, y: height - 120, width: 85.00, height: 85.00), cornerSize: CGSize(width: 60, height: 60))
                        
            // Right wheels
            path.addRoundedRect(in: CGRect(x: width - 260, y: height - 160, width: 160.00, height: 160.00), cornerSize: CGSize(width: 120, height: 120))
            
            path.addRoundedRect(in: CGRect(x: width - 220, y: height - 120, width: 85.00, height: 85.00), cornerSize: CGSize(width: 60, height: 60))

            //Hood
            path.move(to: CGPoint(x: 100, y: height - 85))
            path.addLine(to: CGPoint(x: 35, y: height - 100))
            path.addLine(to: CGPoint(x: 20, y: height - 200))
                        
            // center top body
            path.addLine(to: CGPoint(x: midX - 80, y: height - 340))
            path.addLine(to: CGPoint(x: width - 40, y: height - 250))
            
            // bumper
            path.addLine(to: CGPoint(x: width - 60, y: height - 80))
            path.addLine(to: CGPoint(x: width - 100, y: height - 80))
            
            // Window
            path.move(to: CGPoint(x: 140, y: height - 230))
            path.addLine(to: CGPoint(x: midX - 80, y: height - 320))
            path.addLine(to: CGPoint(x: midX + 120, y: height - 280))
            path.addLine(to: CGPoint(x: midX + 125, y: height - 240))
            path.addLine(to: CGPoint(x: 140, y: height - 230))
            
            // Left Mud Gaurd
            
            path.move(to: CGPoint(x: 90, y: height - 90))
            path.addLine(to: CGPoint(x: 90, y: height - 130))
            path.addLine(to: CGPoint(x: 120, y: height - 170))
            path.addLine(to: CGPoint(x: 240, y: height - 170))
            path.addLine(to: CGPoint(x: 270, y: height - 130))
            path.addLine(to: CGPoint(x: 270, y: height - 80))
            
            // Footer
            path.move(to: CGPoint(x: 270, y: height - 90))
            path.addLine(to: CGPoint(x: width - 270, y: height - 90))

            // Right Mud Gaurd
            path.move(to: CGPoint(x: width - 270, y: height - 80))
            path.addLine(to: CGPoint(x: width - 270, y: height - 130))
            path.addLine(to: CGPoint(x: width - 240, y: height - 170))
            path.addLine(to: CGPoint(x: width - 120, y: height - 170))
            path.addLine(to: CGPoint(x: width - 90, y: height - 130))
            path.addLine(to: CGPoint(x: width - 90, y: height - 80))
            
            path.move(to: CGPoint(x: width - 90, y: height - 90))
            path.addLine(to: CGPoint(x: width - 60, y: height - 90))

        }
    }
}

struct TeslaTruckShapeProvider: PreviewProvider {

    static var previews: some View {
        TeslaTruckShape().stroke(lineWidth: 4).previewLayout(.fixed(width: 2532 / 3.0, height: 1170 / 3.0)).background(Color.white).foregroundColor(.black)
    }
}
