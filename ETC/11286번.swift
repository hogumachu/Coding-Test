// 출처 : 백준 절댓값 힙
// https://www.acmicpc.net/problem/11286
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var absHeap = Heap()

    for _ in 0..<n {
        let value = Int(readLine()!)!
        if value == 0 {
            if absHeap.isEmpty() {
                print(0)
            } else {
                print(absHeap.remove()!)
            }
        } else {
            absHeap.add(value)
        }
    }
}

solution()


struct Heap {
    var array: [Int] = []
    var compare : (Int, Int) -> Bool = {
        if abs($0) == abs($1) {
            return $0 > $1
        } else {
            return abs($0) > abs($1)
        }
    }

    mutating func add(_ x: Int) {
        array.append(x)
        var index = array.count - 1
        while index > 0, compare(array[(index-1)/2], array[index]) {
            array.swapAt((index-1)/2, index)
            index = (index-1)/2
        }
    }

    mutating func remove() -> Int? {
        if array.isEmpty { return nil }
        array.swapAt(0, array.count - 1)
        let returnValue = array.removeLast()
        var index = 0
        while index < array.count {
            let compareIndex = index*2+1
            var changed = false
            if compareIndex+1 < array.count {
                if compare(array[index], array[compareIndex]) {
                    if compare(array[compareIndex], array[compareIndex+1]) {
                        array.swapAt(index, compareIndex+1)
                        index = compareIndex+1
                        changed = true
                    } else {
                        array.swapAt(index, compareIndex)
                        index = compareIndex
                        changed = true
                    }
                } else if compare(array[index], array[compareIndex+1]) {
                    array.swapAt(index, compareIndex+1)
                    index = compareIndex+1
                    changed = true
                }
            } else if compareIndex < array.count {
                if compare(array[index], array[compareIndex]) {
                    array.swapAt(index, compareIndex)
                    index = compareIndex
                    changed = true
                }
            } else {
                break
            }
            if !changed {
                break
            }
        }
        return returnValue
    }
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}
