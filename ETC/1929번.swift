// 출처 : 백준 소수 구하기
// https://www.acmicpc.net/problem/1929
// 풀이 : hogumachu

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
var array = Array.init(repeating: true, count: 10000000)

array[1] = false
for num in 2...input[1] {
    if array[num] == false {
        continue
    }

    var count = num * 2
    while count < input[1] + num {
        array[count] = false
        count += num
    }
}

for num in input[0]...input[1] {
    if array[num] == true {
        print(num)
    }
}
