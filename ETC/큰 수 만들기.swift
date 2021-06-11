// 출처 : 프로그래머스 탐욕법(Greedy) 큰 수 만들기
// https://programmers.co.kr/learn/courses/30/lessons/42883
// 풀이 : hogumachu

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var values: [Int] = []
    var maxValue = -1
    var maxIndex = -1

    var result = ""
    for num in number {
        values.append(Int(String(num))!)
    }
    var counting = values.count - k
    for i in 0...k {
        if values[i] > maxValue {
            maxValue = values[i]
            maxIndex = i
        }
    }
    result += "\(maxValue)"
    maxValue = -1
    counting -= 1
    var nextIndex = maxIndex + 1
    while true {
        if counting == 0 {
            break
        }
        for i in nextIndex...values.count - counting {
            if values[i] > maxValue {
                maxValue = values[i]
                maxIndex = i
            }
            if maxValue == 9 {
                break
            }
        }
        result += "\(maxValue)"
        maxValue = -1
        counting -= 1
        nextIndex = maxIndex + 1
    }
    return result
}
