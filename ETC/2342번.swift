// 출처 : 백준 Dance Dance Revolution
// https://www.acmicpc.net/problem/2342
// 풀이 : hogumachu
// 배열로 해당 위치에 따른 값을 설정해줌
// weight[a][b] = a 에서 b 를 밟았을 때 드는 힘
// dp는 0에서 시작해서 values.count - 2 까지 진행 (values - 1 이면 끝)
// 재귀함수로 왼쪽 발을 바꾼 것 + 그에 따른 힘의 합과 오른쪽 발을 바꾼 것 + 그에 따른 힘을 비교하여 진행함.

let values = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: -1, count: 100_000), count: 5), count: 5)
let weight = [
    [1, 2, 2, 2, 2],
    [2, 1, 3, 4, 3],
    [2, 3, 1, 3, 4],
    [2, 4, 3, 1, 3],
    [2, 3, 4, 3, 1]
]

func solution(_ n: Int, _ left: Int, _ right: Int) -> Int{
    if n == values.count - 1 {
        return 0
    }

    if dp[left][right][n] != -1 {
        return dp[left][right][n]
    }

    dp[left][right][n] = min(solution(n + 1, values[n], right) + weight[left][values[n]],
                             solution(n + 1, left, values[n]) + weight[right][values[n]])

    return dp[left][right][n]
}

print(solution(0, 0, 0))
