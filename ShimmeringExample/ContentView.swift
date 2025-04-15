//
//  ContentView.swift
//  ShimmeringExample
//
//  Created by Raj S on 15/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var isSkeletonOn: Set<Int> = .init()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                card1
                    .skeleton(isOn: isSkeletonOn.contains(1))
                    .onTapGesture {
                        toggleSkeleton(1)
                    }
                
                card2
                    .skeleton(isOn: isSkeletonOn.contains(2))
                    .onTapGesture {
                        toggleSkeleton(2)
                    }
                
                card3
                    .skeleton(isOn: isSkeletonOn.contains(3))
                    .onTapGesture {
                        toggleSkeleton(3)
                    }
            }
            .padding()
        }
    }
    
}

private extension ContentView {
    
    func toggleSkeleton(_ index: Int) {
        if isSkeletonOn.contains(index) {
            isSkeletonOn.remove(index)
        } else {
            isSkeletonOn.insert(index)
        }
    }
    
    var card1: some View {
        VStack(spacing: 8) {
            Image(systemName: "figure.basketball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 100)
            
            Text("Hello EveryOne")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Welcome to Shimmering Effect")
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).stroke())
    }
    
    var card2: some View {
        HStack(spacing: 16) {
            Image(systemName: "figure.basketball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.gray)
                .frame(height: 50)
            
            
            VStack {
                Text("Hello EveryOne")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Welcome to Shimmering Effect")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).stroke())
    }
    
    var card3: some View {
        VStack(spacing: 8) {
            Image(systemName: "figure.basketball")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 100)
            
            Text("Hello EveryOne")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Welcome to Shimmering Effect")
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.blue)
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).fill().foregroundStyle(.yellow))
    }
}


#Preview {
    ContentView()
}
