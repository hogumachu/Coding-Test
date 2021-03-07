// 출처 : 백준 좌표 압축
// https://www.acmicpc.net/problem/18870
// 풀이 : hogumachu

var valueSet = Set<Int>()
var valueDictionary: [Int:Int] = [:]

let _ = readLine()!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}

for n in input {
    valueSet.insert(n)
}

let sortedValue = valueSet.sorted()
var count = 0

for value in sortedValue {
    valueDictionary.updateValue(count, forKey: value)
    count += 1
}
var result = ""

for value in input {
    result += "\(valueDictionary[value]!) "
}

print(result)
