// 출처 : 백준 거짓말
// https://www.acmicpc.net/problem/1043
// 풀이 : hogumachu
// 매우 비효율적인 재귀함수 호출
// 문제 데이터가 너무 작아서 비효율적으로 해도 시간 초과가 나지 않음

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    let secondInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    var truth: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    var result = m
    var party: [[Int]] = []
    if secondInput[0] != 0 {
        for i in 1...secondInput[0] {
            truth[secondInput[i]][secondInput[i]] = -1
        }
    }

    for _ in 0..<m {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        party.append(Array(value[1...value.count-1]))
    }
    for i in party {
        if i.count != 1 {
            for j in 0..<i.count-1 {
                for k in j+1..<i.count {
                    if i[j] != i[k] {
                        truth[i[j]][i[k]] = 1
                        truth[i[k]][i[j]] = 1
                    }
                }
            }
        }
    }
    func connected(_ i: Int) -> Void {
        for j in 1...n {
            if truth[i][j] == 1 {
                truth[i][j] = -1
                truth[i][i] = -1
                truth[j][i] = -1
                truth[j][j] = -1
                connected(j)
            }
        }
    }
    for i in 1...n {
        if truth[i].contains(-1) {
            connected(i)
        }
    }
    for i in party {
        for j in i {
            if truth[j][j] == -1 {
                result -= 1
                break
            }
        }
    }
    print(result)
}

solution()
