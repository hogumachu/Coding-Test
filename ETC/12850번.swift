// 출처 : 백준  본대 산책2
// https://www.acmicpc.net/problem/12850
// 풀이 : hogumachu
// O(8^3 * log N)
// O(n) 도 시간초과가 뜸 (n 의 수가 매우 큼)
// 다시 풀어보기

var dp =    [[0, 1, 1, 0, 0, 0, 0, 0],
            [1, 0, 1, 1, 0, 0, 0, 0],
            [1, 1, 0, 1, 0, 1, 0, 0],
            [0, 1, 1, 0, 1, 1, 0, 0],
            [0, 0, 0, 1, 0, 1, 1, 0],
            [0, 0, 1, 1, 1, 0, 0, 1],
            [0, 0, 0, 0, 1, 0, 0, 1],
            [0, 0, 0, 0, 0, 1, 1, 0]]
dp = pow(dp, Int(readLine()!)!)
print(dp[0][0])
func mult(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
    var returnArr = Array(repeating: Array(repeating: 0, count: 8), count: 8)
    for i in 0..<8 {
        for j in 0..<8 {
            for k in 0..<8 {
                returnArr[i][j] = (returnArr[i][j] + arr1[i][k] * arr2[k][j]) % 1_000_000_007
            }
        }
    }
    return returnArr
}

func pow(_ arr: [[Int]], _ n: Int) -> [[Int]] {
    if n == 1 {
        return arr
    } else {
        if n % 2 == 1 {
            return mult(arr, pow(mult(arr, arr), n / 2))
        } else {
            return pow(mult(arr, arr), n / 2)
        }
    }
}
