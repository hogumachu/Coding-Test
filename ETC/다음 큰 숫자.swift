// 출처 : 프로그래머스 연습문제 다음 큰 숫자
// https://programmers.co.kr/learn/courses/30/lessons/12911
// 풀이 : hogumachu

import Foundation

func solution(_ n:Int) -> Int {
    var divN = n
    var values: [Int] = []
    while divN != 0 {
        values.append(divN % 2)
        divN /= 2
    }
    var swapIndex = -1
    for i in 1..<values.count {
        if values[i-1] == 1 && values[i] == 0 {
            swapIndex = i
            break
        }
    }

    if swapIndex != -1 {
        let swapValue = values[swapIndex]
        values[swapIndex] = values[swapIndex-1]
        values[swapIndex-1] = swapValue
        swapIndex -= 2
        if swapIndex > 0 {
            var zeroCount = 0
            var oneCount = 0
            for i in 0...swapIndex {
                if values[i] == 0 {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            }
            for i in 0..<oneCount {
                values[i] = 1
            }
            for i in oneCount..<zeroCount+oneCount {
                values[i] = 0
            }
        }
    } else {
        var zeroCount = 0
        var oneCount = 0
        for i in 0..<values.count {
            if values[i] == 0 {
                zeroCount += 1
            } else {
                oneCount += 1
            }
        }
        for i in 0..<oneCount-1 {
            values[i] = 1
        }
        values[oneCount-1] = 0
        for i in oneCount..<zeroCount + oneCount {
            values[i] = 0
        }
        values.append(1)
    }

    var mult = 1
    var result = 0
    for i in 0..<values.count {
        result += values[i] * mult
        mult *= 2
    }
    return result
}
