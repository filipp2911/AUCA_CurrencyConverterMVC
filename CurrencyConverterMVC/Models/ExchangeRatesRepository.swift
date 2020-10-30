//
//  ExchangeRatesRepository.swift
//  CurrencyConverterMVC
//
//  Created by Grigorii Derzhanskii on 10/30/20.
//

protocol ExchangeRatesRepository {
    func fetch(completionHandler: (ExchangeRates)->Void)
}
