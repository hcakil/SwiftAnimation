//
//  HomeView.swift
//  Restart
//
//  Created by Labor Bilişim on 6.06.2022.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
       //     Color(.white).ignoresSafeArea(.all,edges: .all)
            VStack(spacing:20) {
               // MARK: - HEADER
                Spacer()
                // MARK: - CENTER
             
             
                
                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("character-2")
                            .resizable()
                            .scaledToFit()
                        .padding()
                        .offset(y:isAnimating ? 35 : -35)
                        .animation(Animation
                            .easeInOut(duration: 4)
                                .repeatForever()
                                   ,value: isAnimating
                        )
                } //:ZSTACK
                    
                
                Text("""
                    It's not how  much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,10)
                // MARK: - FOOTER
                
                Spacer()
                Button(action: {
                    withAnimation{
                        playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                    }
                } ){
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        
                }//: BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                Spacer()
             
            }//:VSTACK
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
        } //:ZSTACK
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
