//
//  StringExtension.swift
//  Greenmoons-interview
//
//  Created by p.charoensinputthakh on 2/9/2566 BE.
//

import Foundation

extension String {
    func convertToFormattedDate() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMMM d, yyyy"
            return outputFormatter.string(from: date)
        } else {
            let inputFormatterWithTime = DateFormatter()
            inputFormatterWithTime.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            if let dateWithTime = inputFormatterWithTime.date(from: self) {
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "MMMM d, yyyy"
                return outputFormatter.string(from: dateWithTime)
            } else {
                return nil
            }
        }
    }

}

