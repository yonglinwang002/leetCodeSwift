//
//  sort.swift
//  leetTest
//
//  Created by 王永林 on 2017/8/25.
//
//

import Foundation

class QuickSortClass: NSObject {
    
    
    func quickSort (array : inout [Int], left : Int,right :Int) {
        
        if left >= right {
            return
        }
        
        let temp = array[left]
        var i = left
        var j = right
        
        while i != j {
            
            while array[j]>temp && i<j {
                j -= 1
            }
            
            while array[i]<=temp && i<j {
                i += 1
            }
            
            if i < j {
                let t = array[i]
                array[i] = array[j]
                array[j] = t
            }
        }
        
        array[left]=array[i]
        array[i]=temp
        
        print(array)
        
        self.quickSort(array: &array, left: left, right: i-1)
        self.quickSort(array: &array, left: i+1, right: right)
    }
    
    
    func sort(array : inout [Int]) {
        self.quickSort(array: &array, left: 0, right: array.count-1)
    }
    
}
