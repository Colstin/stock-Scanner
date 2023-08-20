//
//  MostActiveStock.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 8/20/23.
//

import Foundation

// MARK: - Most Active Stocks ( This will scan for highest volume)
struct MostActiveStock: Codable {
    let source: String
    let start, count, total: Int
    let description: String
    let quotes: [Quote]
}

// MARK: - Quote
struct Quote: Codable {
    let language, region, quoteType, typeDisp: String
    let quoteSourceName: String
    let triggerable: Bool
    let customPriceAlertConfidence: String
    let lastCloseTevEbitLtm, lastClosePriceToNNWCPerShare: Double
    let currency: String
    let regularMarketChangePercent: Double
    let exchange: String
    let fiftyTwoWeekLow, fiftyTwoWeekHigh: Double
    let shortName, averageAnalystRating: String
    let postMarketChangePercent: Double
    let postMarketTime: Int
    let postMarketPrice, postMarketChange, regularMarketChange: Double
    let regularMarketTime: Int
    let regularMarketPrice, regularMarketDayHigh: Double
    let regularMarketDayRange: String
    let regularMarketDayLow: Double
    let regularMarketVolume: Int
    let regularMarketPreviousClose, bid, ask: Double
    let bidSize, askSize: Int
    let market, messageBoardID, fullExchangeName, longName: String
    let financialCurrency: String
    let regularMarketOpen: Double
    let averageDailyVolume3Month, averageDailyVolume10Day: Int
    let fiftyTwoWeekLowChange, fiftyTwoWeekLowChangePercent: Double
    let fiftyTwoWeekRange: String
    let fiftyTwoWeekHighChange, fiftyTwoWeekHighChangePercent, fiftyTwoWeekChangePercent: Double
    let earningsTimestamp, earningsTimestampStart, earningsTimestampEnd, trailingAnnualDividendRate: Int
    let trailingPE: Double
    let trailingAnnualDividendYield: Int
    let marketState: String
    let epsTrailingTwelveMonths, epsForward, epsCurrentYear, priceEpsCurrentYear: Double
    let sharesOutstanding: Int
    let bookValue, fiftyDayAverage, fiftyDayAverageChange, fiftyDayAverageChangePercent: Double
    let twoHundredDayAverage, twoHundredDayAverageChange, twoHundredDayAverageChangePercent: Double
    let marketCap: Int
    let forwardPE, priceToBook: Double
    let sourceInterval, exchangeDataDelayedBy: Int
    let exchangeTimezoneName, exchangeTimezoneShortName: String
    let gmtOffSetMilliseconds: Int
    let esgPopulated, tradeable, cryptoTradeable: Bool
    let firstTradeDateMilliseconds, priceHint: Int
    let displayName, symbol: String

    enum CodingKeys: String, CodingKey {
        case language, region, quoteType, typeDisp, quoteSourceName, triggerable, customPriceAlertConfidence, lastCloseTevEbitLtm, lastClosePriceToNNWCPerShare, currency, regularMarketChangePercent, exchange, fiftyTwoWeekLow, fiftyTwoWeekHigh, shortName, averageAnalystRating, postMarketChangePercent, postMarketTime, postMarketPrice, postMarketChange, regularMarketChange, regularMarketTime, regularMarketPrice, regularMarketDayHigh, regularMarketDayRange, regularMarketDayLow, regularMarketVolume, regularMarketPreviousClose, bid, ask, bidSize, askSize, market
        case messageBoardID = "messageBoardId"
        case fullExchangeName, longName, financialCurrency, regularMarketOpen, averageDailyVolume3Month, averageDailyVolume10Day, fiftyTwoWeekLowChange, fiftyTwoWeekLowChangePercent, fiftyTwoWeekRange, fiftyTwoWeekHighChange, fiftyTwoWeekHighChangePercent, fiftyTwoWeekChangePercent, earningsTimestamp, earningsTimestampStart, earningsTimestampEnd, trailingAnnualDividendRate, trailingPE, trailingAnnualDividendYield, marketState, epsTrailingTwelveMonths, epsForward, epsCurrentYear, priceEpsCurrentYear, sharesOutstanding, bookValue, fiftyDayAverage, fiftyDayAverageChange, fiftyDayAverageChangePercent, twoHundredDayAverage, twoHundredDayAverageChange, twoHundredDayAverageChangePercent, marketCap, forwardPE, priceToBook, sourceInterval, exchangeDataDelayedBy, exchangeTimezoneName, exchangeTimezoneShortName, gmtOffSetMilliseconds, esgPopulated, tradeable, cryptoTradeable, firstTradeDateMilliseconds, priceHint, displayName, symbol
    }
}
