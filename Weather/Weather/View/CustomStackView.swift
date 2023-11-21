//
//  CustomStackView.swift
//  Weather
//
//  Created by Gabriele Perillo on 14/11/23.
//

import SwiftUI

struct CustomStackView <Title: View, Content: View>: View {
    var titleView: Title
    var contentView: Content
    
    // Offset...
    @State var topOffset: CGFloat = 0
    @State var bottomOffset: CGFloat = 0
    
    init(@ViewBuilder titleView: @escaping ()->Title, @ViewBuilder contentView: @escaping ()->Content) {
        
        self.contentView = contentView()
        self.titleView = titleView()
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            titleView
                .font(.callout)
                .lineLimit(1)
                .foregroundStyle(.white)
            // Max Height...
                .frame(height: 38)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(content: {
                    Corner(corners: bottomOffset < 38 ? .allCorners: [.topLeft, .topRight], radius: 12)
                        .foregroundStyle(.ultraThinMaterial)
                        .opacity(0.3)
                        .zIndex(1)
                        .opacity(getOpacity())
                    

                })
            
            
            
            VStack {
                
                Divider()
                
                contentView
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
            }
            .background(content: {
                Corner(corners:[.bottomLeft, .bottomRight], radius: 12)
                    .foregroundStyle(.ultraThinMaterial)
                    .opacity(0.3)
                    .offset(y: topOffset >= 160 ? 0: (topOffset - 160))
                    .zIndex(0)
                    .clipped()
                
            })
            
        }
        .colorScheme(.light)
        .cornerRadius(12)
        .opacity(getOpacity())
        .offset(y: topOffset >= 160 ? 0: -topOffset + 160)
        .background (
         
            GeometryReader{ proxy -> Color in
                
                let minY = proxy.frame(in: .global).minY
                let maxY = proxy.frame(in: .global).maxY

                
                DispatchQueue.main.async {
                    self.topOffset = minY
                    self.bottomOffset = maxY + 2000
                }
                
                return Color.clear
            }
        )
        .modifier(CornerModifier(bottomOffset: $bottomOffset))
    }
    
    func getOpacity()-> CGFloat {
        
        if bottomOffset < 28 {
            
            let progress = bottomOffset / 28
            
            return progress
        }
        return 1
    }
}


#Preview {
    ContentView()
}

// Creating a new Modifier
struct CornerModifier: ViewModifier {
    
    @Binding var bottomOffset: CGFloat
    
    func body(content: Content) -> some View {
        
        if bottomOffset < 38 {
            content
        }
        else {
            content.cornerRadius(12)
        }
    }
    
}
