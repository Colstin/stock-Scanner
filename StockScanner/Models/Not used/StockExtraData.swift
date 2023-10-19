//
//  StockStatistics.swift
//  StockScanner
//
//  Created by Colstin Donaldson on 9/3/23.
//

import Foundation

struct StockExtraData: Codable {
    var statistics: Statistics
}

struct Statistics: Codable {
    var stock_statistics: StockStatistics
}

struct StockStatistics: Codable {
    var float_shares: Int?
}



/*
{
  "statistics": {
    "stock_statistics": {
      "shares_outstanding": 15634199552,
      "float_shares": 15617034345,
      "avg_10_volume": 49829910,
      "avg_30_volume": 53283788,
      "shares_short": 88852352,
      "short_ratio": 1.55,
      "short_percent_of_shares_outstanding": 0.0057,
      "percent_held_by_insiders": 0.00071999995,
      "percent_held_by_institutions": 0.61317
    },
      "valuations_metrics": {
        "market_capitalization": 2967996465152,
        "enterprise_value": 3008859471872,
        "trailing_pe": 31.797789,
        "forward_pe": 28.71903,
        "peg_ratio": 28.71903,
        "price_to_sales_ttm": 7.7302127,
        "price_to_book_mrq": 49.282192,
        "enterprise_to_revenue": 7.837,
        "enterprise_to_ebitda": 24.273
      },
      "financials": {
        "fiscal_year_ends": "2022-09-24",
        "most_recent_quarter": "2023-06-30",
        "profit_margin": 0.24681,
        "operating_margin": 0.29231,
        "return_on_assets_ttm": 0.20896,
        "return_on_equity_ttm": 1.60093,
        "income_statement": {
          "revenue_ttm": 383932989440,
          "revenue_per_share_ttm": 24.22,
          "quarterly_revenue_growth": -0.014,
          "gross_profit_ttm": 170782000000,
          "ebitda": 123957000000,
          "net_income_to_common_ttm": 94760001536,
          "diluted_eps_ttm": 5.97,
          "quarterly_earnings_growth_yoy": 0.023
        },
        "balance_sheet": {
          "total_cash_mrq": 62482001920,
          "total_cash_per_share_mrq": 3.996,
          "total_debt_mrq": 109280002048,
          "total_debt_to_equity_mrq": 181.305,
          "current_ratio_mrq": 0.982,
          "book_value_per_share_mrq": 3.852
        },
        "cash_flow": {
          "operating_cash_flow_ttm": 113071996928,
          "levered_free_cash_flow_ttm": 90680500224
        }
      },
    "stock_price_summary": {
      "fifty_two_week_low": 124.17,
      "fifty_two_week_high": 198.23,
      "fifty_two_week_change": 18.54,
      "beta": 1.286802,
      "day_50_ma": 186.7088,
      "day_200_ma": 163.40675
    },
    "dividends_and_splits": {
      "forward_annual_dividend_rate": 0.96,
      "forward_annual_dividend_yield": 0.0050999997,
      "trailing_annual_dividend_rate": 0.93,
      "trailing_annual_dividend_yield": 0.004908688,
      "5_year_average_dividend_yield": 0.86,
      "payout_ratio": 0.156,
      "dividend_date": "2023-08-17",
      "ex_dividend_date": "2023-05-12",
      "last_split_factor": "4-for-1 split",
      "last_split_date": "2020-08-31"
    }
  }
}

*/


