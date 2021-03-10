// 출처 : 백준 크로스워드 만들기
// https://www.acmicpc.net/problem/2804
// 풀이 : hogumachu
// 시간 제한은 1초이고 두 단어가 서로 30글자 이내여서 조건이 까다롭지 않았음
// 단어중에 동일한 것이 있나 확인하고
// 동일한 것이 있으면 index 값으로 설정하고 break하여 result에 추가해주었음

import Foundation

let input = readLine()!.split(separator: " ").map{$0}
let a = input[0].map{$0}
let b = input[1].map{$0}
var indexX = 0
var indexY = 0
var result = Array(repeating: Array(repeating: Character("."), count: a.count), count: b.count)
var loop = true
for i in 0..<a.count {
    if loop == false {
        break
    }

    for j in 0..<b.count {
        if a[i] == b[j] {
            indexX = j
            indexY = i
            loop = false
            break

        }
    }
}

for i in 0..<a.count {
    result[indexX][i] = a[i]
}
for i in 0..<b.count {
    result[i][indexY] = b[i]
}

for i in result {
    print(String(i))
}
