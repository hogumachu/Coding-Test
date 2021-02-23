// 출처 : 백준 일곱 난쟁이
// https://www.acmicpc.net/problem/2309
// 풀이 : hogumachu


import Foundation

var dwarf: [Int] = []
var notDwarf: [(Int,Int)] = []
var sum = 0
for _ in 1...9 {
    let value = Int(readLine()!)!
    dwarf.append(value)
    sum += value
}

dwarf.sort(by: <)

for i in 0..<dwarf.count-1 {
    var compare = sum
    for j in i+1..<dwarf.count {
        compare = sum - dwarf[i] - dwarf[j]
        if compare == 100 {
            notDwarf.append((i,j))
            break
        }
    }
}



for i in 0..<dwarf.count {
    if i == notDwarf[0].0 || i == notDwarf[0].1 {
        continue
    } else {
        print(dwarf[i])
    }
}
