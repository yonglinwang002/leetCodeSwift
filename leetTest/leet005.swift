//
//  leet005.swift
//  leetTest
//
//  Created by 王永林 on 2017/8/25.
//
//

import Foundation

//Input: "babad"
//
//Output: "bab"
//
//Note: "aba" is also a valid answer.

class Leet005Solution {
    //** 写的太复杂了，但执行效率很高
    func longestPalindrome2(_ s: String) -> String {
        let startTime = NSDate.init()
        let chars = Array (s.characters)
        let stringLenth  =  s.characters.count
        var maxSubChars = 0
        var maxSubStringLeft = 0
        var maxSubStringRight = 0
        if chars.count <= 1 {
            return s
        }
        
        var current = stringLenth-1
        var currentLeft = current
        var currentRight = current
        let rightPointIndex =  2*stringLenth - 2
        let center = stringLenth-1
        var subStringLeft =  0
        var subStringRight = rightPointIndex
        var subStringLen =  stringLenth

        while current >= 0 && current <= rightPointIndex && subStringLen > maxSubChars {
            let startInteval = current % 2 == 1 ? 1:2

            var left = current - startInteval
            var right = current + startInteval
            
            while left >= subStringLeft && right <= subStringRight && subStringLen > maxSubChars{
                if chars[left/2] == chars [right/2] {
                    let len = (right -  left)/2 + 1
                    if len > maxSubChars {
                        maxSubChars = len
                        maxSubStringLeft =  left/2
                        maxSubStringRight = right/2
                    }
                    
                    left -= 2
                    right += 2
                }
                else
                {
                    break
                }
            }
            if current >= center {
                currentLeft -= 1
                current = currentLeft
            }
            else
            {
                currentRight += 1
                current = currentRight
            }
            
            subStringLeft = current>center ? 2*current - rightPointIndex : 0
            subStringRight = current>center ? rightPointIndex: 2*current
            subStringLen =  (subStringRight - subStringLeft)/2 + 1
        }
        let endTime = NSDate.init()
        print("\(endTime.timeIntervalSince(startTime as Date))")
        return String(chars[maxSubStringLeft...maxSubStringRight])
    }
    
    //** 字符串中最长的回文子字符串
    func longestPalindrome(_ s: String) -> String {
        let startTime = NSDate.init()
        var left = 0
        var right = s.characters.count - 1
        let chars = Array (s.characters)
        var maxSubChars = 0
        var maxSubStringLeft = 0
        var maxSubStringRight = 0
        if chars.count <= 1 {
            return s
        }
        
        while left < chars.count && ((right - left + 1) > maxSubChars){
            while left < right && ((right - left + 1) > maxSubChars) {
//                print("left \(left) right \(right)")
                let subStringCharArray = chars[left...right]
                if self.isPalindrome(subStringCharArray) {
                    if subStringCharArray.count > maxSubChars {
                        maxSubChars = subStringCharArray.count
                        maxSubStringLeft = left
                        maxSubStringRight = right
                    }
                    break
                }
                else
                {
                    right -= 1
                }
            }
            left += 1
            right = s.characters.count - 1
        }
        let endTime = NSDate.init()
        print("\(endTime.timeIntervalSince(startTime as Date))")
        return String(chars[maxSubStringLeft...maxSubStringRight])
    }
    
    func isPalindrome(_ chars: ArraySlice<Character>) -> Bool {
        if chars.count<1 {
            return true
        }
        
        for i in 0..<chars.count/2 {
            if chars[chars.startIndex+i] != chars [chars.endIndex-1 - i] {
                return false
            }
        }
        return true
    }
}
