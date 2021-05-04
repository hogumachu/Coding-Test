// 출처 : 백준 구간 합 구하기 4
// https://www.acmicpc.net/problem/11659
// 풀이 : hogumachu
// 시간 복잡도 생각하기
// 여러 번의 반복을 하는 것보다 한번 for문 반복으로 해결 가능한지 먼저 고민하기

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    var sum: [Int] = [0]
    for i in 0..<values.count {
        sum.append(values[i]+sum[i])
    }

    for _ in 0..<input[1] {
        let select = readLine()!.split(separator: " ").map{Int(String($0))!}
        let value = sum[select[1]]-sum[select[0]-1]
        print(value)
    }
}

solution()
