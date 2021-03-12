// 출처 : 백준 카잉 달력
// https://www.acmicpc.net/problem/6064
// 풀이 : hogumachu
// 단순한 반복문으로 하나씩 더 했는데 시간 초과가 나왔음
// m*n의 반복을 하게 되면 시간 초과가 나왔음
// 그래서 만약 값이 같으면 값을 result에 넣어서 break를 하고
// 이전 값과 현재 값이 동일하면 계속 같은 것이 반복된다는 뜻이므로 -1을 넣어주고 break 하였음

import Foundation

let T = Int(readLine()!)!

var result: [Int] = []

for _ in 0..<T {
    let read = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = read[0], n = read[1], x = read[2], y = read[3]
    var a = 1, b = 1
    var before = (0, 0)
    var count = 1
    for _ in 1...m*n {
        if x - a >= 0, y - b >= 0, x - a == y - b {
            count += x - a
            result.append(count)
            break
        } else if a + n - b + 1 <= m {
            count += n-b+1
            a += n-b+1
            b = 1
        } else if b + m - a + 1 <= n {
            count += m-a+1
            b += m-a+1
            a = 1
        }
        if before.0 == a, before.1 == b {
            result.append(-1)
            break
        } else {
            before = (a, b)
        }
    }
}

for i in result {
    print(i)
}
