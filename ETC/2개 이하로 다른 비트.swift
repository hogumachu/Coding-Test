// 출처 : 프로그래머스 월간 코드 챌린지 시즌2 2개 이하로 다른 비트
// https://programmers.co.kr/learn/courses/30/lessons/77885
// 풀이 : hogumachu

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var result: [Int64] = []

    for number in numbers {
        var divNumber = number
        if divNumber == 0 {
            result.append(1)
        } else {
            var convert = false
            var divedNumbers: [Int] = []
            var counting = 0
            var convertIndex = -1
            while divNumber > 0 {
                if convert {
                    if divNumber % 2 == 0 {
                        divedNumbers.append(0)
                    } else {
                        divedNumbers.append(1)
                    }
                } else {
                    if divNumber % 2 == 0 {
                        divedNumbers.append(1)
                        convertIndex = counting
                        convert = true
                    } else {
                        divedNumbers.append(1)
                    }
                    counting += 1
                }
                divNumber /= 2
            }
            if !convert {
                divedNumbers.append(0)
                divedNumbers[divedNumbers.count - 1] = 1
                convertIndex = divedNumbers.count - 1
            }

            for i in 0..<convertIndex {
                if divedNumbers[convertIndex - 1 - i] == 1 {
                    divedNumbers[convertIndex - 1 - i] = 0
                    break
                }
            }
            var multedValue = 0
            var mult = 1

            for value in divedNumbers {
                multedValue += value * mult
                mult *= 2
            }
            result.append(Int64(multedValue))
        }
    }

    return result
}
