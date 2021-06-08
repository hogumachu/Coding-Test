// 출처 : 프로그래머스 완전 탐색 소수 찾기
// https://programmers.co.kr/learn/courses/30/lessons/42839
// 풀이 : hogumachu

import Foundation

func solution(_ numbers:String) -> Int {
    var values: [Int] = []
    var newNumbers: [Int] = []
    for number in numbers {
        values.append(Int(String(number))!)
    }
    func makeNewNumbers(_ index: [Int], _ sum: Int) -> Void {
        for i in 0..<values.count {
            if !index.contains(i)  {
                if !newNumbers.contains(sum * 10 + values[i]) {
                    newNumbers.append(sum * 10 + values[i])
                }
                var nextIndex = index
                nextIndex.append(i)
                makeNewNumbers(nextIndex, sum * 10 + values[i])
            }
        }
    }
    for i in 0..<values.count {
        if !newNumbers.contains(values[i]) {
            newNumbers.append(values[i])
        }
        makeNewNumbers([i], values[i])
    }
    var isPrime: [Bool] = Array(repeating: true, count: newNumbers.max()! + 1)
    isPrime[0] = false
    isPrime[1] = false
    if isPrime.count > 4 {
        for i in 2..<isPrime.count {
            if isPrime[i] {
                for j in 2..<isPrime.count {
                    if i * j < isPrime.count {
                        isPrime[i * j] = false
                    } else {
                        break
                    }
                }
            }

        }
    }
    var result = 0
    for number in newNumbers {
        if isPrime[number] {
            result += 1
        }
    }
    return result
}
