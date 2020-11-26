//
//  ViewController.swift
//  CurrencyConverterMVC
//
//  Created by Grigorii Derzhanskii on 10/30/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var sourceValueTextField: UITextField!
    @IBOutlet weak var exchangeRatesTableView: UITableView!
    @IBOutlet weak var conversionResultLabel: UILabel!
    
    
    let exchangeRatesRepository = InMemoryExchangeRatesRepository()
    
    var exchangeRates: ExchangeRates?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        exchangeRatesRepository.fetch(completionHandler: { exchangeRates in
            self.exchangeRates = exchangeRates
        })
        
        AF.request("https://api.exchangeratesapi.io/latest").response { response in
            if let responseData = response.data ,
               let responseDataString = String(data: responseData, encoding: .utf8) {
                print(responseDataString)
            }
        }
        
        exchangeRatesTableView.dataSource = self
    }


    
    @IBAction func handleConvertButtonTap(_ sender: Any) {
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchangeRates?.rates.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exchangeRate = exchangeRates!.rates[indexPath.row]
        
        let exchangeRateCell = tableView.dequeueReusableCell(withIdentifier: "InterfaceCurrancy", for: indexPath) as! InterfaceCurrancy
        
        exchangeRateCell.titleLabel.text = "\(exchangeRate.currency)"
        exchangeRateCell.subtitleLabel.text = "\(exchangeRate.exchangeRate)"
        
        return exchangeRateCell
    }
    
    
}
