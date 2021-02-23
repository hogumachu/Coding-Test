// 출처 : 백준 셀프 넘버
// https://www.acmicpc.net/problem/4673
// 풀이 : hogumachu

import Foundation

var value: [Int] = []

for i in 1...10000 {
    if i < 10 {
        value.append(i*2)
    } else {
        var count = i
        var num = i
        while count != 0 {
            num += count % 10
            count = count / 10
        }
        value.append(num)
    }
}
value.sort(by: <)


for i in 1...10000 {

    if value.first! < i {
        value.removeFirst()
    }
    if value.first != i {
        print(i)
    } else {
        //print(i)
        value.removeFirst()
    }

}
