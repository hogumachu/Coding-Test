// 출처 : 백준 골드바흐의 추측
// https://www.acmicpc.net/problem/9020
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var prime: [Int] = []
var array = Array.init(repeating: true, count: 100000)
var values = [Int]()

array[1] = false

for num in 2...10000 {
    if array[num] == false {
        continue
    }
    var count = num * 2
    while count < 10000 + num {
        array[count] = false
        count += num
    }
}
for num in 2...20000 {
    if array[num] == true {
        prime.append(num)
    }
}

for _ in 1...input {
    values.append(Int(readLine()!)!)
}

for v in values {
    var countOne = 0
    var countTwo = 0
    while prime[countTwo] < v {
        countTwo += 1
    }
    if countTwo != 1 {
        countTwo -= 1
    }
    var resultSet: [(Int, Int, Int)] = []
    for i in 0...countTwo {
        for j in 0...countTwo {
            if prime[j] + prime[countTwo - i] == v {
                countOne = j
                if prime[countTwo - i] -  prime[countOne] >= 0 {
                    resultSet.append((prime[countOne], prime[countTwo - i], prime[countTwo - i] -  prime[countOne]))
                }
                break
            }
        }
    }
    resultSet.sort(by: {$0.2 < $1.2})
    print("\(resultSet[0].0) \(resultSet[0].1)")
}
