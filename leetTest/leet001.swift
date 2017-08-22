//
//  leet001.swift
//  leetTest
//
//  Created by 王永林 on 2017/8/22.
//
//

import Foundation
class leet001 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            let a = nums[i]
            for j in i+1..<nums.count {
                let b = nums[j]
                if a+b == target {
                    return [i,j]
                    
                }
            }
        }
        return []
    }
}
