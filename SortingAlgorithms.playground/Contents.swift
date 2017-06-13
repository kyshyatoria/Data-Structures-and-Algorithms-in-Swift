//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func selectionSort<T:Comparable>(a:[T])->[T]{
    //let i = 0
    // let j = 0
    var arr = a
    guard arr.count > 1 else {
        return arr
    }
    
    for i in 0...arr.count-1 {
        var temp_min = i
        for j in i+1..<arr.count{
            if arr[j] < arr[temp_min]{
                temp_min = j
            }
        }
        exchange(n1: &arr[i], n2: &arr[temp_min])
    }
    return arr
}

func exchange<T>(n1:inout T,n2:inout T){
    let temp = n1
    n1 = n2
    n2 = temp
}
var arr:Array<Int> = [5,1,7,3];
selectionSort(a: arr)

func insertionSort<T:Comparable>(a:[T])->[T]{
    
    //pick an element i , and insert it in 0 ... i-1.
    var a = a
    for i in 1..<a.count{
        let key = a[i]
        var j = i-1
        while(j>=0) && a[j] > key {
            a[j+1] = a[j]
            j-=1
        }
        a[j+1] = key
    }
    return a
}

arr = [5,1,7,3];
print(insertionSort(a: arr))

func insertionSortRecursive<T:Comparable>(a:inout [T],n:Int){
    if n <= 1{
        return
    }
    insertionSortRecursive(a:&a , n: n-1)
    //insert nth element at correct position. do the same for rest .
    let key = a[n-1]
    var j = n-2
    
    while(j >= 0 && a[j] > key){
        a[j+1] = a[j]
        j-=1
    }
    a[j+1] = key
}

arr = [5,1,7,3];
insertionSortRecursive(a: &arr, n: arr.count-1)

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [T] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

arr = [5,1,7,3];
mergeSort(arr)


func partition<T:Comparable>(arr:inout [T],l:Int,h:Int) -> Int{
    let pivot = arr[h]
    var i = l
    var j = l
    while j <= h-1{
        if arr[j] <= pivot {
            
            exchange(n1: &arr[i], n2: &arr[j])
            i+=1
        }
        j+=1
    }
    guard i != h else {
        return i
    }
    swap(&arr[i], &arr[h])
    return i
}

func quickSort<T:Comparable>(arr:inout [T],l:Int,h:Int){
    if l<h{
        let p = partition(arr: &arr, l: l, h: h)
        quickSort(arr: &arr, l: l, h: p-1)
        quickSort(arr: &arr, l: p+1, h: h)
    }
}

arr = [5,1,7,3];
quickSort(arr: &arr, l: 0, h: arr.count-1)


