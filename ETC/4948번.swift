// 출처 : 백준 베르트랑 공준
// https://www.acmicpc.net/problem/4948
// 풀이 : hogumachu

import Foundation

var array = Array.init(repeating: true, count: 500000)

while let input = Int(readLine()!){
    if input == 0 {
        break
    }
    var result = 0
    array[1] = false
    for num in 1...input * 2 {
        if array[num] == false {
            continue
        }

        var count = num * 2
        while count < input * 2 + num {
            array[count] = false
            count += num
        }
    }

    for num in input+1...input * 2 {
        if array[num] == true {
            result += 1
        }
    }
    print(result)
}
