//
//  InMemoryExchangeRatesRepository.swift
//  CurrencyConverterMVC
//
//  Created by Grigorii Derzhanskii on 10/30/20.
//

class InMemoryExchangeRatesRepository : ExchangeRatesRepository {
    
    func fetch(completionHandler: (ExchangeRates) -> Void) {
        let exchangeRatesList = [
            CurrencyExchangeRate(currency: .usd, exchangeRate: 1.2234),
            CurrencyExchangeRate(currency: .eur, exchangeRate: 1.0),
            CurrencyExchangeRate(currency: .kgs, exchangeRate: 90)
        ]
        let exchangeRates = ExchangeRates(baseCurrency: .eur, rates: exchangeRatesList)
        completionHandler(exchangeRates)
    }
    
}
