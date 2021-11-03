// 출처 : 백준 연속합 2
// https://www.acmicpc.net/problem/13398
// 풀이 : hogumachu

let n = Int(readLine()!)!

let values = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var removedArr = Array(repeating: 0, count: n)
var notRemovedArr = Array(repeating: 0, count: n)

removedArr[0] = 0
notRemovedArr[0] = values[0]

var result = values[0]

for i in 1..<values.count {
    notRemovedArr[i] = max(notRemovedArr[i - 1] + values[i], values[i])
    removedArr[i] = max(notRemovedArr[i - 1], removedArr[i - 1] + values[i])

    result = max(result, notRemovedArr[i], removedArr[i])
}

print(result)
