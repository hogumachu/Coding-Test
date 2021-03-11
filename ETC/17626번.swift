// 출처 : 백준 Four Squares
// https://www.acmicpc.net/problem/17626
// 풀이 : hogumachu
// 4개 안으로 표현이 가능하다 해서 1, 2, 3 이 아닌 경우에는 그냥 4로 했음
// 시간 제한이 0.5초라 통과 못할 줄 알았는데 했음

import Foundation

let value = Int(readLine()!)!
var squared: [Int] = []
var count = 1
var result = 0
while count * count <= value {
    squared.append(count * count)
    count += 1
}

if squared.contains(value) {
    result = 1
} else {
    for i in 0..<squared.count {
        let first = squared[squared.count - i - 1]
        if squared.contains(value - first) {
            result = 2
            break
        }
        if first < value/2 {
            break
        }
    }
    if result == 0 {
        for i in 0..<squared.count {
            for j in i..<squared.count {
                if squared.contains(value - squared[squared.count - i - 1] - squared[squared.count - j - 1]) {
                    result = 3
                    break
                }

            }
        }
    }
    if result == 0 {
        result = 4
    }

}

print(result)
