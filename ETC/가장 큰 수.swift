// 출처 : 프로그래머스 정렬 가장 큰 수
// https://programmers.co.kr/learn/courses/30/lessons/42746
// 풀이 : hogumachu

import Foundation

func solution(_ numbers:[Int]) -> String {
    var values: [pq] = Array(repeating: pq(), count: 10)
    for number in numbers {
        if number/1000 != 0 {
            values[number/1000].insert(number)
        } else if number/100 != 0 {
            values[number/100].insert(number)
        } else if number/10 != 0 {
            values[number/10].insert(number)
        } else {
            values[number].insert(number)
        }
    }

    var result = ""
    var isZero = 0
    for i in 0...9 {
        while !values[9-i].isEmpty() {
            let returnValue = values[9-i].remove()!
            result += "\(returnValue)"
            isZero += returnValue
        }
    }
    print(values)
    if isZero == 0 {
        return "0"
    } else {
        return result
    }
}

struct pq {
    var array: [Int] = []

    func compare(_ a: Int, _ b: Int) -> Bool {
        var aLength = 0
        var bLength = 0

        if a / 1000 != 0 {
            aLength = 10000
        } else if a / 100 != 0 {
            aLength = 1000
        } else if a / 10 != 0 {
            aLength = 100
        } else {
            aLength = 10
        }
        if b / 1000 != 0 {
            bLength = 10000
        } else if b / 100 != 0 {
            bLength = 1000
        } else if b / 10 != 0 {
            bLength = 100
        } else {
            bLength = 10
        }
        let aAndb = a * bLength + b
        let bAnda = b * aLength + a

        if aAndb > bAnda {
            return false
        } else {
            return true
        }
    }

    mutating func insert(_ x: Int) -> Void {
        if array.isEmpty {
            array.append(x)
        } else {
            var index = array.count
            array.append(x)
            while index > 0 {
                if index % 2 == 0 {
                    if compare(array[index/2 - 1], array[index]) {
                        array.swapAt(index/2 - 1, index)
                        index = index/2 - 1
                    } else {
                        return
                    }
                } else {
                    if compare(array[index/2], array[index]) {
                        array.swapAt(index/2, index)
                        index = index/2
                    } else {
                        return
                    }
                }
            }
        }
    }

    mutating func remove() -> Int? {
        if array.count == 0 {
            return nil
        }else if array.count == 1 {
            return array.removeLast()
        } else {
            array.swapAt(0, array.count - 1)
            let returnValue = array.removeLast()
            var index = 0
            while true {
                if index * 2 + 2 < array.count {
                    if compare(array[index], array[index*2+2]) && compare(array[index], array[index*2+1]) {
                        if compare(array[index*2+2], array[index*2+1]) {
                            array.swapAt(index, index*2+1)
                            index = index*2+1
                        } else {
                            array.swapAt(index, index*2+2)
                            index = index*2+2
                        }
                    } else if compare(array[index], array[index*2+2]) &&  compare(array[index*2+1], array[index]) {
                        array.swapAt(index, index*2+2)
                        index = index*2+2
                    } else  if compare(array[index*2+2], array[index]) && compare(array[index], array[index*2+1])  {
                        array.swapAt(index, index*2+1)
                        index = index*2+1
                    } else {
                        return returnValue
                    }
                } else if index * 2 + 1 < array.count {
                    if  compare(array[index], array[index*2+1])  {
                        array.swapAt(index, index*2+1)
                        index = index*2+1
                    } else {
                        return returnValue
                    }
                } else {
                    return returnValue
                }
            }
        }
    }
    func returnArray() -> [Int] {
        return array
    }
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}
