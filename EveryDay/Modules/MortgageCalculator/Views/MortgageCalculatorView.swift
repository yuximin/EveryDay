//
//  MortgageCalculatorView.swift
//  EveryDay
//
//  Created by apple on 2024/1/30.
//

import SwiftUI

struct MortgageCalculatorView: View {
    
    @State private var totalAmountText: String = "112"
    @State private var totalCountText: String = "360"
    @State private var annualizedRateText: String = "0.0588"
    
    @State private var inputErrorState: Bool = false
    @State private var inputErrorMessage: String = ""
    
    @State private var showDetailState: Bool = false
    
    var totalAmount: Int {
        Int(self.totalAmountText) ?? 0
    }
    
    var totalCount: Int {
        Int(self.totalCountText) ?? 0
    }
    
    var annualizedRate: Double {
        Double(annualizedRateText) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("总金额（万元）")
                .foregroundStyle(.black)
                .font(.system(size: 18, weight: .semibold))
            TextField("请输入总金额（万元）", text: $totalAmountText)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(.white)
                .foregroundStyle(.black)
                .font(.system(size: 16, weight: .semibold))
                .keyboardType(.asciiCapableNumberPad)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(radius: 6)
            Text("期数（月）")
                .foregroundStyle(.black)
                .font(.system(size: 18, weight: .semibold))
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            TextField("请输入期数（月）", text: $totalCountText)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(.white)
                .foregroundStyle(.black)
                .font(.system(size: 16, weight: .semibold))
                .keyboardType(.asciiCapableNumberPad)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(radius: 6)
            Text("利率")
                .foregroundStyle(.black)
                .font(.system(size: 18, weight: .semibold))
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            TextField("请输入利率", text: $annualizedRateText)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(.white)
                .foregroundStyle(.black)
                .font(.system(size: 16, weight: .semibold))
                .keyboardType(.decimalPad)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(radius: 6)
            Button(action: {
                commitAction()
            }, label: {
                Text("开始计算")
                    .foregroundStyle(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            .frame(maxWidth: .infinity)
            .padding([.top], 10)
            Spacer()
        }
        .padding()
        .alert(inputErrorMessage, isPresented: $inputErrorState, actions: {
            Button(role: .cancel) {
                
            } label: {
                Text("OK")
            }
        })
        .navigationDestination(isPresented: $showDetailState) {
            MortgageDetailView(totalAmount: self.totalAmount, totalCount: self.totalCount, annualizedRate: annualizedRate)
        }
    }
    
    private func commitAction() {
        guard self.totalAmount > 0 else {
            inputErrorMessage = "总金额输入有误，请重新输入"
            inputErrorState = true
            return
        }
        
        guard self.totalCount > 0 else {
            inputErrorMessage = "期数输入有误，请重新输入"
            inputErrorState = true
            return
        }
        
        guard self.annualizedRate > 0 else {
            inputErrorMessage = "利率输入有误，请重新输入"
            inputErrorState = true
            return
        }
        
        self.showDetailState = true
    }
}

#Preview {
    MortgageCalculatorView()
}
