//
//  ExchangeRatesRoot.swift
//  CurrencyConverterMVC
//
//  Created by Filipp Krupnov on 10/30/20.
//

import Foundation
struct ExchangeRatesRoot: Codable {
    
    var base: String
    var date: String
    var rates: Rates
}
