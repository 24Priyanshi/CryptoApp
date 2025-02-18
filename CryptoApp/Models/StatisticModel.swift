//
//  StatisticModel.swift
//  CryptoApp
//
//  Created by Jai  on 16/09/23.
//

import Foundation

struct StatisticModel: Identifiable {
    let  id =  UUID().uuidString
    
    let title:String
    let value:String
    let percentageChange:Double?
    
    init(title: String, value: String, PercentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = PercentageChange
    }
}
//let newModel = StatisticModel(title: "", value: "", PercentageChange: 69)
//let newModel2 = StatisticModel(title: "", value: "")

