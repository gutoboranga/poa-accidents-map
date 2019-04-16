//
//  DataRepository.swift
//  AcidentesPOA
//
//  Created by Augusto Boranga on 15/04/19.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation
import MapKit

class DataRepository {
    
    public func get() -> [CLLocationCoordinate2D] {

        var locations = [CLLocationCoordinate2D]()
        
        if let rawData = readCSV(filename: "acidentes-2016") {
            if let parsedLines = parseContent(rawData) {

                for item in parsedLines {
                    
                    if let lat = Double(item[2]),
                        let long = Double(item[1]) {
                        
                        let l = CLLocationCoordinate2D(latitude: lat, longitude: long)
                        locations.append(l)
                    
                    }
                }
            }
        }
        
        return locations
        
    }
    
    private func parseContent(_ rawData: String) -> [[String]]? {
        
        var items = [[String]]()
        
        let lines = rawData.components(separatedBy: "\n")
        
        for line in lines {
            
            let splitted = line.components(separatedBy: ";")
            
            if splitted.count > 1 {
                items.append(splitted)
            }
            
        }
        
        return items
        
    }
    
    private func readCSV(filename: String) -> String? {
        
        guard let filepath = Bundle.main.path(forResource: filename, ofType: "csv") else {
            return nil
        }
        
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
        
    }
    
}
