//
//  leet003.swift
//  leetTest
//
//  Created by 王永林 on 2017/8/22.
//
//

//** 查找字符串中最大的不重复子字符串的个数
import Foundation

class Leet004Solution {
//    Given "abcabcdb", the answer is "abcd", which the length is 3.
//    
//    Given "bbbbb", the answer is "b", with the length of 1.
//    
//    Given "pwwkew", the answer is "wke", with the length of 3.
    
//    33.7033159732819
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var start = 0
        var right = 0
        let chars = Array (s.characters)
        let sLen = s.characters.count
        if right >= sLen {
            return sLen
        }
        var maxLen = 0
        let startTime = NSDate.init()
//        var currentChar
        
        
        print("start")
        while right < sLen{
//            print("\(NSDate.init()) start \(start)")
            var isnew = false
//            let startIndex = s.index(s.startIndex, offsetBy: start)
//            currentChar = chars[right]
            var tempCharArray = Array<Character>(chars[start..<right])
            while right < sLen && !isnew {
                let rightChar = chars[right]
                let index = tempCharArray.index(of: rightChar)
                if index != nil {
                    isnew = true
                    start += index! + 1
                    right += 1
                    break
                }
                else
                {
                    tempCharArray.append(rightChar)
                    right += 1
                }
            }
            if tempCharArray.count > maxLen {
                maxLen = tempCharArray.count
            }
        }
        let endTime = NSDate.init()
        
        print("\(endTime.timeIntervalSince(startTime as Date))")
        return maxLen
    }
    
    

    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var start = 0
        var right = 0
        let chars = Array (s.characters)
        let sLen = s.characters.count
        if right >= sLen {
            return sLen
        }
        var tempCharArray = Array<Character>()
        var maxLen = 0
//        let startTime = NSDate.init()
        while right < sLen{

            if tempCharArray.contains(chars[right]) {
                if maxLen < right - start {
                    maxLen = right - start
                }
                while (tempCharArray.first != chars [right]) {
                    tempCharArray.removeFirst()
                    start += 1
                }
                
                tempCharArray.removeFirst()
                start += 1
                tempCharArray.append(chars[right])
            }
            else{
                tempCharArray.append(chars[right])
            }
            right += 1
        }
        
        if maxLen < right - start {
            maxLen = right - start
        }
//        let endTime = NSDate.init()
//        print("\(endTime.timeIntervalSince(startTime as Date))")
        return maxLen
    }
}
