//
//  ExchangeRates.swift
//  CurrencyConverterMVC
//
//  Created by Grigorii Derzhanskii on 10/30/20.
//

class ExchangeRates {
    
    let baseCurrency: Currency
    let rates: [CurrencyExchangeRate]
    
    init(baseCurrency: Currency, rates: [CurrencyExchangeRate]) {
        self.baseCurrency = baseCurrency
        self.rates = rates
    }
}
