//
//  leet002.swift
//  leetTest
//
//  Created by 王永林 on 2017/8/22.
//
//

import Foundation
 //Definition for singly-linked list.
public class ListNode {
    public var val: Int //0~9
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8

class Leet002Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (l1 != nil) && (l2 != nil) {
            let first = (l1?.val)! + (l2?.val)!
            let newListNode = ListNode(first)
            newListNode.next = addTwoNumbers(l1?.next,l2?.next)
            var p = newListNode
            while p.val>=10 {
                p.val = p.val - 10
                if p.next == nil {
                    p.next = ListNode(0)
                }
                p.next?.val += 1
                p = p.next!
            }
            return newListNode
        }
        else {
            if (l1 != nil) {
                let newListNode = ListNode((l1?.val)!)
                newListNode.next = l1?.next
                return newListNode
            }
            
            if (l2 != nil) {
                let newListNode = ListNode((l2?.val)!)
                newListNode.next = l2?.next
                return newListNode
            }
        }
        
        return nil
    }
    
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1, q = l2 ,curr = dummyHead
        var carry = 0
        while ((p != nil) || (q != nil)) {
            let x = (p != nil) ? p?.val : 0
            let y = (q != nil) ? q?.val : 0
            let sum = carry + x! + y!
            carry = sum / 10
            curr.next = ListNode (sum % 10)
            curr = curr.next!
            if (p != nil) {
                p = p!.next
            }
            if (q != nil) {
                q = q!.next
            }
        }
        if carry > 0 {
            curr.next = ListNode (carry)
        }
        
        return dummyHead.next
    }
}
