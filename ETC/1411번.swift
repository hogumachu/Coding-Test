// 출처 : 백준 비슷한 단어
// https://www.acmicpc.net/problem/1411
// 풀이 : hogumachu

let n = Int(readLine()!)!
var values: [[Int]] = Array(repeating: [], count: n)
var result = 0
for i in 0..<n {
    let input = readLine()!.map{$0}
    var value: [Int] = []
    var dic: [Character:Int] = [:]
    var counting = 0
    for j in 0..<input.count {
        if dic[input[j]] == nil {
            dic[input[j]] = counting
            value.append(counting)
            counting += 1
        } else {
            value.append(dic[input[j]]!)
        }
    }
    values[i].append(contentsOf: value)
}
for i in 0..<values.count - 1 {
    for j in i+1..<values.count {
        if values[i] == values[j] {
            result += 1
        }
    }
}
print(result)
