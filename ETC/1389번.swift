// 출처 : 백준 케빈 베이컨의 6단계 법칙
// https://www.acmicpc.net/problem/1389
// 풀이 : hogumachu
// BFS로 푸는 문제
// 그러나 그냥 풀어봤는데 맞았음
// 다음부터는 알고리즘을 잘 활용하여 풀기 !!

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    var friend: [[Int]] = Array(repeating: [], count: n+1)
    var friendCount: [[Int]] = Array(repeating: Array(repeating: n, count: n+1), count: n+1)

    func findFriend(_ from: Int, _ to: Int, _ count: Int) -> Void {
        for i in friend[to] {
            if from != i && friendCount[from][i] > count {
                friendCount[from][i] = count
                findFriend(to, i, count)
                findFriend(from, i, count+1)
            }
        }
     }

    for _ in 0..<m {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        friend[value[0]].append(value[1])
        friend[value[1]].append(value[0])
        friendCount[value[0]][value[1]] = 1
        friendCount[value[1]][value[0]] = 1
    }

    for i in 1...n {
        for connected in friend[i] {
            findFriend(i, connected, 2)
        }
    }
    var min = m * n
    var result = 0
    for i in 1..<friendCount.count {
        let sum = friendCount[i].reduce(0, +) - n * 2
        if sum < min {
            min = sum
            result = i
        }
    }
    print(result)
}

solution()
