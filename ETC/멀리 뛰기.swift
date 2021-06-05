// 출처 : 프로그래머스 연습문제 멀리 뛰기
// https://programmers.co.kr/learn/courses/30/lessons/12914
// 풀이 : hogumachu

func solution(_ n:Int) -> Int {
    var dp: [Int] = [0, 1, 2]
    var result = 0
    if n <= 2 {
        return dp[n]
    } else {
        for i in 3...n {
            dp.append((dp[i-1] + dp[i-2]) % 1234567)
        }
    }
    return dp[n]
}
