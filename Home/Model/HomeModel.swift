//
//  HomeModel.swift
//  Test
//
//  Created by UMESH MADATHA on 06/09/22.
//

import Foundation
// MARK: - HomeModel
struct HomeModel: Codable {
    let sf: String
    let lfs: [LF]
}

// MARK: - LF
struct LF: Codable {
    let lf: String
    let freq, since: Int
    let vars: [LF]?
}
typealias Model = [HomeModel]
