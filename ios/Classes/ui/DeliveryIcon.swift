//
//  DeliveryIcon.swift
//  flutter_mapbox_navigation
//
//  Created by Francesco Romeo on 07/03/24.
//
import SwiftUI

struct DeliveryIcon: Shape {
    func path(in rect: CGRect) -> Path {
           var path = Path()
           let width = rect.size.width
           let height = rect.size.height
           path.move(to: CGPoint(x: 0.75651*width, y: 0.49487*height))
           path.addCurve(to: CGPoint(x: 0.99469*width, y: 0.24875*height), control1: CGPoint(x: 0.88805*width, y: 0.49487*height), control2: CGPoint(x: 0.99469*width, y: 0.38468*height))
           path.addCurve(to: CGPoint(x: 0.75651*width, y: 0.00263*height), control1: CGPoint(x: 0.99469*width, y: 0.11282*height), control2: CGPoint(x: 0.88805*width, y: 0.00263*height))
           path.addCurve(to: CGPoint(x: 0.51833*width, y: 0.24875*height), control1: CGPoint(x: 0.62496*width, y: 0.00263*height), control2: CGPoint(x: 0.51833*width, y: 0.11282*height))
           path.addCurve(to: CGPoint(x: 0.75651*width, y: 0.49487*height), control1: CGPoint(x: 0.51833*width, y: 0.38468*height), control2: CGPoint(x: 0.62496*width, y: 0.49487*height))
           path.closeSubpath()
           path.move(to: CGPoint(x: 0.86298*width, y: 0.15164*height))
           path.addLine(to: CGPoint(x: 0.71306*width, y: 0.30656*height))
           path.addLine(to: CGPoint(x: 0.65026*width, y: 0.24121*height))
           path.addCurve(to: CGPoint(x: 0.63765*width, y: 0.23572*height), control1: CGPoint(x: 0.64672*width, y: 0.23755*height), control2: CGPoint(x: 0.64252*width, y: 0.23572*height))
           path.addCurve(to: CGPoint(x: 0.62505*width, y: 0.24121*height), control1: CGPoint(x: 0.63279*width, y: 0.23572*height), control2: CGPoint(x: 0.62859*width, y: 0.23755*height))
           path.addCurve(to: CGPoint(x: 0.61952*width, y: 0.25423*height), control1: CGPoint(x: 0.62151*width, y: 0.24486*height), control2: CGPoint(x: 0.61967*width, y: 0.24921*height))
           path.addCurve(to: CGPoint(x: 0.62461*width, y: 0.26726*height), control1: CGPoint(x: 0.61937*width, y: 0.25926*height), control2: CGPoint(x: 0.62107*width, y: 0.2636*height))
           path.addLine(to: CGPoint(x: 0.70067*width, y: 0.34586*height))
           path.addCurve(to: CGPoint(x: 0.71306*width, y: 0.35134*height), control1: CGPoint(x: 0.70421*width, y: 0.34952*height), control2: CGPoint(x: 0.70834*width, y: 0.35134*height))
           path.addCurve(to: CGPoint(x: 0.72544*width, y: 0.34586*height), control1: CGPoint(x: 0.71778*width, y: 0.35134*height), control2: CGPoint(x: 0.7219*width, y: 0.34952*height))
           path.addLine(to: CGPoint(x: 0.88819*width, y: 0.17769*height))
           path.addCurve(to: CGPoint(x: 0.8935*width, y: 0.16466*height), control1: CGPoint(x: 0.89173*width, y: 0.17403*height), control2: CGPoint(x: 0.8935*width, y: 0.16969*height))
           path.addCurve(to: CGPoint(x: 0.88819*width, y: 0.15164*height), control1: CGPoint(x: 0.8935*width, y: 0.15963*height), control2: CGPoint(x: 0.89173*width, y: 0.15529*height))
           path.addCurve(to: CGPoint(x: 0.87559*width, y: 0.14615*height), control1: CGPoint(x: 0.88465*width, y: 0.14798*height), control2: CGPoint(x: 0.88045*width, y: 0.14615*height))
           path.addCurve(to: CGPoint(x: 0.86298*width, y: 0.15164*height), control1: CGPoint(x: 0.87072*width, y: 0.14615*height), control2: CGPoint(x: 0.86652*width, y: 0.14798*height))
           path.closeSubpath()
           path.move(to: CGPoint(x: 0.45565*width, y: 0.18656*height))
           path.addLine(to: CGPoint(x: 0.41497*width, y: 0.16239*height))
           path.addCurve(to: CGPoint(x: 0.374*width, y: 0.15075*height), control1: CGPoint(x: 0.402*width, y: 0.15463*height), control2: CGPoint(x: 0.38834*width, y: 0.15075*height))
           path.addCurve(to: CGPoint(x: 0.33304*width, y: 0.16239*height), control1: CGPoint(x: 0.35966*width, y: 0.15075*height), control2: CGPoint(x: 0.34601*width, y: 0.15463*height))
           path.addLine(to: CGPoint(x: 0.04628*width, y: 0.33278*height))
           path.addCurve(to: CGPoint(x: 0.01607*width, y: 0.36347*height), control1: CGPoint(x: 0.03331*width, y: 0.34054*height), control2: CGPoint(x: 0.02324*width, y: 0.35077*height))
           path.addCurve(to: CGPoint(x: 0.00531*width, y: 0.4058*height), control1: CGPoint(x: 0.0089*width, y: 0.37617*height), control2: CGPoint(x: 0.00531*width, y: 0.39028*height))
           path.addLine(to: CGPoint(x: 0.00531*width, y: 0.74233*height))
           path.addCurve(to: CGPoint(x: 0.01607*width, y: 0.78466*height), control1: CGPoint(x: 0.00531*width, y: 0.75785*height), control2: CGPoint(x: 0.0089*width, y: 0.77196*height))
           path.addCurve(to: CGPoint(x: 0.04628*width, y: 0.81535*height), control1: CGPoint(x: 0.02324*width, y: 0.79736*height), control2: CGPoint(x: 0.03331*width, y: 0.80759*height))
           path.addLine(to: CGPoint(x: 0.33304*width, y: 0.98573*height))
           path.addCurve(to: CGPoint(x: 0.374*width, y: 0.99737*height), control1: CGPoint(x: 0.34601*width, y: 0.99349*height), control2: CGPoint(x: 0.35966*width, y: 0.99737*height))
           path.addCurve(to: CGPoint(x: 0.41497*width, y: 0.98573*height), control1: CGPoint(x: 0.38834*width, y: 0.99737*height), control2: CGPoint(x: 0.402*width, y: 0.99349*height))
           path.addLine(to: CGPoint(x: 0.70173*width, y: 0.81535*height))
           path.addCurve(to: CGPoint(x: 0.73194*width, y: 0.78466*height), control1: CGPoint(x: 0.7147*width, y: 0.80759*height), control2: CGPoint(x: 0.72477*width, y: 0.79736*height))
           path.addCurve(to: CGPoint(x: 0.74269*width, y: 0.74233*height), control1: CGPoint(x: 0.73911*width, y: 0.77196*height), control2: CGPoint(x: 0.74269*width, y: 0.75785*height))
           path.addLine(to: CGPoint(x: 0.74269*width, y: 0.57366*height))
           path.addCurve(to: CGPoint(x: 0.66076*width, y: 0.55785*height), control1: CGPoint(x: 0.7142*width, y: 0.57219*height), control2: CGPoint(x: 0.68672*width, y: 0.56675*height))
           path.addLine(to: CGPoint(x: 0.66076*width, y: 0.74127*height))
           path.addLine(to: CGPoint(x: 0.41497*width, y: 0.88837*height))
           path.addLine(to: CGPoint(x: 0.41497*width, y: 0.5984*height))
           path.addLine(to: CGPoint(x: 0.56824*width, y: 0.50667*height))
           path.addCurve(to: CGPoint(x: 0.47895*width, y: 0.39218*height), control1: CGPoint(x: 0.53054*width, y: 0.47633*height), control2: CGPoint(x: 0.49981*width, y: 0.43716*height))
           path.addLine(to: CGPoint(x: 0.29412*width, y: 0.28304*height))
           path.addLine(to: CGPoint(x: 0.374*width, y: 0.23542*height))
           path.addLine(to: CGPoint(x: 0.44978*width, y: 0.28068*height))
           path.addCurve(to: CGPoint(x: 0.44873*width, y: 0.25413*height), control1: CGPoint(x: 0.44908*width, y: 0.27192*height), control2: CGPoint(x: 0.44873*width, y: 0.26307*height))
           path.addCurve(to: CGPoint(x: 0.45565*width, y: 0.18656*height), control1: CGPoint(x: 0.44873*width, y: 0.23095*height), control2: CGPoint(x: 0.45111*width, y: 0.20834*height))
           path.closeSubpath()
           path.move(to: CGPoint(x: 0.33304*width, y: 0.5984*height))
           path.addLine(to: CGPoint(x: 0.33304*width, y: 0.88837*height))
           path.addLine(to: CGPoint(x: 0.08724*width, y: 0.74127*height))
           path.addLine(to: CGPoint(x: 0.08724*width, y: 0.4513*height))
           path.addLine(to: CGPoint(x: 0.33304*width, y: 0.5984*height))
           path.closeSubpath()
           path.move(to: CGPoint(x: 0.45388*width, y: 0.47776*height))
           path.addLine(to: CGPoint(x: 0.374*width, y: 0.52538*height))
           path.addLine(to: CGPoint(x: 0.13128*width, y: 0.3804*height))
           path.addLine(to: CGPoint(x: 0.21117*width, y: 0.33278*height))
           path.addLine(to: CGPoint(x: 0.45388*width, y: 0.47776*height))
           path.closeSubpath()
           return path
       }
}
