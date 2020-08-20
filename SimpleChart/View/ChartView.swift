//
//  ChartView.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/19/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import UIKit
import Charts

class ChartView: UIView, ChartViewDelegate {
    
    let chartView = PieChartView()
    let parties = ["Rent", "Investments", "Subscriptions", "Food"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupChartView()
        
    }
    
    func setupChartView() {
        chartView.delegate = self
        addSubview(chartView)
        chartView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 0, height: 0)
        
        self.setDataCount(4, range: 100)
        
        //Legends
        let legend = chartView.legend
        legend.verticalAlignment = .top
        legend.horizontalAlignment = .center
        legend.formSize = 12
        legend.xEntrySpace = 20
        legend.textColor = .systemBlue
        
        
        chartView.drawEntryLabelsEnabled = false
        chartView.rotationEnabled = false
        chartView.usePercentValuesEnabled = true
        chartView.transparentCircleColor = .clear
        
        //Animate chart
        chartView.animate(xAxisDuration: 1.4, yAxisDuration: 1.4)
    }
    
    func setDataCount(_ count: Int, range: UInt32) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                     label: parties[i % parties.count])
        }
        
        let set = PieChartDataSet(entries: entries, label: "")
        set.drawIconsEnabled = false
        set.sliceSpace = 0
        
        set.colors = [UIColor.simpleBlue1, UIColor.simpleBlue2, UIColor.simpleBlue3, UIColor.simpleBlue4]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 12, weight: .medium))
        data.setValueTextColor(.white)
        
        chartView.data = data
        chartView.highlightValues(nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
