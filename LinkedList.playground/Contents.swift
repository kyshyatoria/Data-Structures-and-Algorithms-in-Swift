//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


public class Node<T>{
    var value : T
    var next : Node?
    weak var previous:Node?
    init(value:T) {
        self.value = value
    }
}

public class LinkedList<T>{
    fileprivate var head : Node<T>?
    private var tail:Node<T>?
    
    public func append(value:T){
        let newNode = Node(value: value)
        
        if self.head == nil {
            head = newNode
        }else{
            newNode.previous = head
            tail?.next = newNode
        }
        tail = newNode
    }
    
    public func isEmpty() -> Bool{
        return (head == nil)
    }
    public func deleteList(){
        head = nil
        tail = nil
    }
    public func deleteNode(node:Node<T>){
        let deletedNodePrev = node.previous
        let deletedNodeNext = node.next
        
        if deletedNodePrev != nil {
            deletedNodePrev?.next = deletedNodeNext
        }else{
            head = deletedNodeNext
        }
        
        if deletedNodeNext == nil {
            tail = deletedNodePrev
        }
        deletedNodeNext?.previous = deletedNodePrev
        deletedNodeNext?.previous = deletedNodePrev
        node.next = nil
        node.previous = nil
    }
    
    public func isCircular()->Bool{
        //empty list is circular
        if head == nil {
            return true
        }
        
        var temp = head?.next
        while temp != nil && temp !== head {
            temp = temp?.next
        }
        return (temp === head)
    }
    
    public func makeItCircular(){
        tail?.next = head
    }
    
    public func middleElement()->T?{
        var middle : T?
        var slowPointer = head
        var fastPointer = head
        
        guard head != nil else {
            return nil
        }
        while fastPointer?.next != nil && fastPointer != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        middle = slowPointer?.value
        return middle
    }
    public func deleteMiddle(){
        var slowP = head
        var fastP = head
        guard head != nil else {
            return
        }
        var midPrevious : Node<T>?
        while fastP != nil && fastP?.next != nil {
            midPrevious = slowP
            slowP = slowP?.next
            fastP = fastP?.next?.next
        }
        //now the slow P points to middle.
        midPrevious?.next = slowP?.next
        slowP?.next?.previous = midPrevious
        slowP?.next = nil
        slowP?.previous = nil
    }
    
    public func reverseList(){
        guard head != nil else {
            return
        }
        var prev:Node<T>?
        var next:Node<T>?
        var current = head
        
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
    public func reverListInGroup(of k:Int)->Node<T>?{
        //reverse for first k
        //recursively reverrse for rest of the list.
        
        guard head != nil else {
            return head
        }
        var prev :Node<T>?
        var next : Node<T>?
        var current = head
        var count = 0
        while current != nil && count < 5{
            count+=1
            next = current?.next
            head?.next = prev
            prev = current
            current = next
        }
        if head?.next != nil {
            head?.next = reverListInGroup(of: k)
        }
        
        return prev
    }
}

extension LinkedList:CustomStringConvertible{
    
    public var description: String {
        var text = "["
        var temp = self.head
        while temp != nil {
            text+="\(temp!.value)"
            if temp?.next != nil {
                text+=" ->"
            }
            temp  = temp?.next
        }
        return text+"]"
    }
}

let dogBreeds = LinkedList<String>()
dogBreeds.append(value: "Labrador")
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Husky")
//dogBreeds.makeItCircular()
dogBreeds.isCircular()
dogBreeds.middleElement()
dogBreeds.deleteMiddle()
print(dogBreeds.description)
dogBreeds.reverseList()
print(dogBreeds.description)

func addToLists(l1:LinkedList<Int>,l2:LinkedList<Int>)->LinkedList<Int>{
    var sum:Int = 0
    var temp1 = l1.head
    var temp2 = l2.head
    let sumList = LinkedList<Int>()
    var carry = 0
    
    while temp1 != nil || temp2 != nil {
        sum  = carry + (temp1?.value ?? 0) + (temp2?.value ?? 0)
        carry = (sum >= 10 ? 1:0)
        sumList.append(value: sum%10)
        temp1 = temp1?.next
        temp2 = temp2?.next
    }
    
    if carry > 0 {
        sumList.append(value: carry)
    }
    return sumList
}

func addTwoNumbersRepresentedByLinkedList(){
    
    let list1  = LinkedList<Int>()
    list1.append(value: 9)
    list1.append(value: 9)
    list1.append(value: 9)
    let list2 = LinkedList<Int>()
    list2.append(value: 9)
    list2.append(value: 9)
    print(list1.description)
    print(list2.description)
    print(addToLists(l1: list1,l2: list2))
}

//addTwoNumbersRepresentedByLinkedList()