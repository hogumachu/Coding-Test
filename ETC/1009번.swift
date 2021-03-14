// 출처 : 백준 분산처리
// https://www.acmicpc.net/problem/1009
// 풀이 : hogumachu
// 첫번째 자리수만 신경쓰면 되므로 % 10을 해주었음
// 만약 값이 10이 나오게 되면 0으로 저장되니
// 그거에 대한 케이스만 추가해주면 해결

import Foundation

func solution() -> Void {
    let T = Int(readLine()!)!
    var result: [Int] = []
    for _ in 0..<T {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let a = input[0], b = input[1]
        var mult = 1
        if a == 1 {
            result.append(1)
        } else {
            for i in 1...b {
                mult *= a % 10
                mult = mult % 10
            }
            result.append(mult)
        }
    }
    for result in result {
        if result == 0 {
            print(10)
        } else {
            print(result)
        }

    }
}

solution()
