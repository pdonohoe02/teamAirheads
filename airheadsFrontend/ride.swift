//
//  ride.swift
//  airheadsFrontend
//
//  Created by Eddie Speer on 3/4/23.
//

import Foundation

struct ride: Identifiable, Codable {
    var id: Int32
    var start_loc: String
    var end_loc: String
    var date: Date
}
