// 출처 : 백준 수들의 합
// https://www.acmicpc.net/problem/1821
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], f = input[1]
    var array: [Int] = [1, 1]
    var result: [Int] = []
    if n >= 3 {
        for i in 3...n {
            var newArray = [1]
            for j in 1..<array.count {
                newArray.append(array[j-1] + array[j])
            }
            newArray.append(1)
            array = newArray
        }
    }
    func findValue(_ values: [Int], _ counting: Int) -> Void {
        if !result.isEmpty {
            return
        }
        if counting == n {
            var sum = 0
            for i in 0..<n {
                sum += array[i] * values[i]
            }
            if sum == f {
                for i in 0..<n {
                    result.append(values[i])
                }
                return
            }
        }
        for i in 1...n {
            if !values.contains(i) {
                var newValue = values
                newValue.append(i)
                findValue(newValue, counting + 1)
            }
        }
    }

    for i in 1...n {
        findValue([i], 1)
    }
    var strResult = ""
    for i in result {
        strResult += "\(i) "
    }
    print(strResult)
}

solution()
