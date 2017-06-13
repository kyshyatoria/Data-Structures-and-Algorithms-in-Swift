//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//BINARY SEARCH TREE

public class BST<T:Comparable>{
    var value:T
    var parent:BST<T>?
    var left:BST<T>?
    var right:BST<T>?
    
    init(value:T){
        self.value = value
    }
    
    public func insert(value:T){
        if value < self.value { //insert in left
            if left != nil {
                left?.insert(value: value)
            }else{
                left = BST(value: value)
                left?.parent = self
            }
        }else{ //insert in right
            if right != nil {
                right?.insert(value: value)
            }else{
                right = BST(value: value)
                right?.parent = self
            }
        }
    }
    
    public func insertNew(value:T){
        
        if value < self.value{
            if left != nil {
                left?.insertNew(value: value)
            }else{
                let leftTree = BST(value: value)
                self.left = leftTree
            }
        }else{
            if right != nil {
                right?.insertNew(value: value)
            }else{
                let rightNode = BST(value: value)
                self.right = rightNode
            }
        }
    }
    public func delete(value:T){
        
    }
    
    public func search(value:T)->BST<T>?{
        if value < self.value { //search in left
            return left?.search(value: value)
        }else if value > self.value { //search in right
            return right?.search(value: value)
        }else{
            return self //Found it
        }
    }
    
    public func iterativeSearch(calye:T)->BST<T>?{
        var node :BST<T>? = self
        while node != nil {
            if value < node!.value{
                node = node!.left
            }else if value > node!.value{
                node = node!.right
            }else{
                return node
            }
        }
        return nil
    }
    
    public func deleteTree(){
        parent = nil //don't really need it.
        left = nil
        right = nil
    }
    public func inOrderTraversal(){
        //root is left.
        left?.inOrderTraversal()
        print(value)
        right?.inOrderTraversal()
    }
    public func preOrderTraversal(){
        print(value)
        left?.preOrderTraversal()
        right?.preOrderTraversal()
    }
    public func postOrderTraversal(){
        left?.postOrderTraversal()
        right?.postOrderTraversal()
        print(value)
    }
    public func min()->T?{
        if self.left == nil {
            return value
        }else{
            return left?.min()
        }
    }
    public func max()->T?{
        if self.right == nil {
            return value
        }
        return right?.max()
    }
    
    public func height()->Int{
        if left == nil && right == nil {
            return 0
        }
        let leftHeight = left?.height() ?? 0
        let rightHeight = right?.height() ?? 0
        
        if leftHeight>rightHeight {
            return 1 + leftHeight
        }else{
            return 1 + rightHeight
        }
    }

//        public func predecessorSuccessor(value:T,succ:inout BST<T>?,pred:inout BST<T>?){
//    
//            if self.value == value {
//                //pred is max in left sub tree
//                if self.left != nil {
//                    var temp = self.left
//                    while temp != nil {
//                        temp = temp?.right
//                    }
//                    pred = temp
//                    //set pred
//                }
//                if self.right != nil {
//                    var temp = self.right
//                    while  temp != nil {
//                        temp = temp?.left
//                    }
//                    //set succ
//                    succ = temp
//                }
//                //succ is min in right sub tree
//                return
//            }
//    
//            if self.value > value { // look in left  //==>> NEED TO FIGURE OUT THIS ERROR
//                succ = self
//                predecessorSuccessor(value:self.left , succ: &succ, pred: &pred)
//            }else{
//                pred = self
//                predecessorSuccessor(value: self.right, succ: &succ, pred: &pred)
//            }
//        }
//    
    
    public func predecssor(value:Int,pred:inout Int){
        if self.value as! Int == value{
            //pred is max in left tree
            if self.left != nil {
                var temp = self.left
                while temp != nil{
                    temp = temp?.right
                }
            }
            return
        }
        
        if self.value as! Int > value { //search in left
            self.left?.predecssor(value: value, pred: &pred )
        }else{
            pred = self.value as! Int
            self.right?.predecssor(value: value, pred: &pred)
        }
    }
    
    public func leafNodes(root:BST<T>?){
        if root != nil {
            leafNodes(root: root?.left)
            if root?.left == nil && root?.right == nil {
                print(root?.value)
            }
            leafNodes(root:root?.right)
        }
    }
    public func toSum(node:BST<T>?){
        
    }
    public func printBoundaryRight(){
        
    }
    
    public func printBoundaryLeft(){
        
    }
    
}

extension BST:CustomStringConvertible{
    public var description: String{
        var str = ""
        if left != nil {
            str+="\(left!.description)<-"
        }
        str+="\(value)"
        if right != nil{
            str+="->\(right!.description)"
        }
        return str
    }
}

let tree = BST<Int>(value: 7)
//tree.insert(value: 2)
//tree.insert(value: 5)
//tree.insert(value: 10)
//tree.insert(value: 9)
//tree.insert(value: 1)

tree.insertNew(value: 2)
tree.insertNew(value: 5)
tree.insertNew(value: 10)
tree.insertNew(value: 9)
tree.insertNew(value: 1)

//if let node = tree.search(value: 9) {
//    print("found")
//}else{
//    print("not found")
//}
//
//if let node = tree.iterativeSearch(calye: 9){
//    print("found")
//}else{
//    print("not founf")
//}

//tree.inOrderTraversal()
//tree.postOrderTraversal()
//tree.preOrderTraversal()

//tree.min()
//tree.max()
//tree.height()
var pred : Int = 6
tree.predecssor(value: 5, pred: &pred)
print(pred)


//func printBoundary(){
//    //print left Boundary
//    //printleft leafs
//    //print right leafs
//    //print right bundary.
//}

