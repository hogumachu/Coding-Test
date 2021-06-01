// 출처 : 프로그래머스 연습문제 피보나치 수
// https://programmers.co.kr/learn/courses/30/lessons/12945
// 풀이 : hogumachu

func solution(_ n:Int) -> Int {
    var fibo: [Int] = Array(repeating: 0, count: 100001)
    fibo[1] = 1

    if n != 1 {
        for i in 2...n {
            fibo[i] = (fibo[i-2] + fibo[i-1]) % 1234567
        }
    }
    return fibo[n]
}
