//
//  ContentView.swift
//  HeartRateCalculatorView
//
//  Created by Saydulayev on 15.03.23.
//

import SwiftUI

struct HeartRateCalculatorView: View {
    @State private var age = ""
    @State private var mhr = ""
    @State private var thr = ""
    
    @State private var colorScheme = Color.self
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.bottom)
            VStack {
                HStack(spacing: 0) {
                    Image(systemName: "waveform.path.ecg")
                    Image(systemName: "waveform.path.ecg")
                        
                        
                }
                .font(.system(size: 70))
                .foregroundColor(.red)
                .padding(.vertical, 40)
                
                Text("Heart Rate Calculator")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                Divider()
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Enter Your Age:")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .onTapGesture {
                            hideKeyboard()
                        }
                }
                .padding(.horizontal)
                .onTapGesture {
                    hideKeyboard()
                }
                
                Button(action: {
                    calculateHeartRate()
                    hideKeyboard() // dismiss keyboard
                }) {
                    Text("Calculate")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 3))
                }
                .padding(.top, 25)
                Spacer()
                
                Text("Fat-burning zone:")
                    .font(.headline)
                    .shadow(color: Color.black, radius: 1)
                    
                
                             VStack(alignment: .leading) {
                    Text("Maximum Heart Rate:")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("\(mhr)")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                        .foregroundColor(.red)
                    
                    Text("Target Heart Rate for Fat Burning:")
                        .font(.headline)
                        .foregroundColor(.black)
                        
                    
                    Text("\(thr)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.green)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                Spacer()
            }
        }
    }
    
    func calculateHeartRate() {
        guard let age = Int(age) else { return }
        
        let mhr = 220 - age
        self.mhr = "\(mhr)"
        
        let thrLow = Int(Double(mhr) * 0.6)
        let thrHigh = Int(Double(mhr) * 0.7)
        self.thr = "\(thrLow) - \(thrHigh)"
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct HeartRateCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateCalculatorView()
    }
}

