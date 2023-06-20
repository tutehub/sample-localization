//
//  LaunchDTO.swift
//  sample_app
//
//  Created by Work Mac on 20/6/2023.
//

import Foundation


struct LaunchDTO: Decodable {
    let flightNumber: Int
    let missionName: String
    let launchDateUnix: Date
    let launchSuccess: Bool
}
