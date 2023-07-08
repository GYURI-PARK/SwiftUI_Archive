//
//  HTMLParser.swift
//  SwiftSoupPractice
//
//  Created by GYURI PARK on 2023/06/24.
//

import Foundation
import SwiftSoup

final class HTMLParser {
    func parse(html: String) {
        print("GOt html")
        do {
            let document: Document = try SwiftSoup.parse(html)
            guard let body = document.body() else {
                return
            }
            
            let headers: [String] = try body.getElementsByTag("div").select("h2 span").compactMap({
                try? $0.html()
            })
            print(headers)
        }
        catch {
            print("Error Parsing: " + String(describing: error))
        }
    }
}
