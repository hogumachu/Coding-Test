// 출처 : 백준 피보나치 수 6
// https://www.acmicpc.net/problem/11444
// 풀이 : hogumachu
// 피보나치를 빠르게 푸는 로직을 이용하여 풀었음

func solution() {
    let n = Int64(readLine()!)!
    let arr = [[1, 1],
             [1, 0]]
    print(power(arr, n)[0][1])
}

func power(_ arr: [[Int]], _ n: Int64) -> [[Int]] {
    if n == 0 {
        let E = [[1, 0],
                 [0, 1]]
        return E
    }
    else if n == 1 {
        return arr
    }
    else {
        let half = power(arr, n / 2)
        let remainder = power(arr, n % 2)
        return mult(mult(half, half), remainder)
    }
}

func mult(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
    var returnArr = [[0, 0],
                     [0, 0]]
    for i in 0...1 {
        for j in 0...1 {
            var adding = 0
            for k in 0...1 {
                adding += (arr1[i][k] * arr2[k][j]) % 1_000_000_007
            }
            returnArr[i][j] = adding % 1_000_000_007
        }
    }
    return returnArr
}

solution()
