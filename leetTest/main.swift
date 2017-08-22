//
//  main.swift
//  leetTest
//
//  Created by 王永林 on 2017/8/22.
//
//

import Foundation




//print("Hello, World!")
//
//let nums = [1,23,4,2]
//let target = 3
//var s = leet001()
//print ("twoSum",s.twoSum(nums, target))


//** Question 2

let L1=ListNode(1)
//L1.next=ListNode(9)
//L1.next?.next=ListNode(4)

let L2=ListNode(9)
L2.next=ListNode(9)
//L2.next?.next=ListNode(3)
//L2.next?.next?.next=ListNode(4)

var L3=Leet002Solution().addTwoNumbers2(L1, L2)

while (L3 != nil)
{
    print(L3?.val)
    L3=L3?.next
}
