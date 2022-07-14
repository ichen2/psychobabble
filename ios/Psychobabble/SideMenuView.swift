//
//  SideMenuView.swift
//  Psychobabble
//
//  Created by Ian Chen on 5/18/22.
//

import SwiftUI

var categories: Array<Category> = [
    Category.CTD,
    Category.GOPS,
    Category.SHB,
    Category.MA,
    Category.I2C,
    Category.AFU,
    Category.GU,
    Category.OMPP
]

func getCategoryName(category: Category) -> String {
    switch category {
        case Category.CTD:
            return "Changing the Tone of a Disagreement"
        case Category.GOPS:
            return "Get Out of a Power Struggle"
        case Category.SHB:
            return "Set Healthy Boundaries"
        case Category.MA:
            return "Make Amends"
        case Category.I2C:
            return "Invite your Mate to Connect"
        case Category.AFU:
            return "Ask for Understanding"
        case Category.GU:
            return "Give Understanding"
        case Category.OMPP:
            return "Own Your Part in the Problem"
    }
}

struct SideMenuView: View {
  
    var onClick: (Category) -> Void;
    var onClose: () -> Void;
    var onHomeSelected: () -> Void;
    var onGuideSelected: () -> Void;
    var onFiltersSelected: () -> Void;

  var body: some View {
      GeometryReader { geometry in
          HStack(spacing: 0) {
              VStack(alignment: .leading) {
                  Text("HOME")
                      .padding(.top, 32)
                      .padding(.bottom, 16)
                      .foregroundColor(Color.black)
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .font(.system(size: 28).bold())
                      .onTapGesture {
                          onHomeSelected()
                      }
                  Text("QUICK GUIDE")
                      .navigationBarBackButtonHidden(true)
                      .padding(.bottom, 16)
                      .foregroundColor(Color.black)
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .font(.system(size: 28).bold())
                      .onTapGesture {
                          onGuideSelected()
                      }
                  Text("FILTERS")
                      .navigationBarBackButtonHidden(true)
                      .padding(.bottom, 16)
                      .foregroundColor(Color.black)
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .font(.system(size: 28).bold())
                      .onTapGesture {
                          onFiltersSelected()
                      }
                  Spacer()
              }
              .padding(24)
              .background(Color(red: 196.0 / 255, green: 196.0 / 255, blue: 196.0 / 255))
              .edgesIgnoringSafeArea(.all)
              .frame(width: abs(geometry.size.width * 0.7), height: abs(UIScreen.main.bounds.height), alignment: .center)
              Button(action: onClose) {
                  Text("").frame(width: abs(geometry.size.width * 0.3), height: abs(UIScreen.main.bounds.height), alignment: .center)
                      .opacity(0.0)
              }
          }
      }
  }
  
}
