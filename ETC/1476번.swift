// 출처 : 백준 날짜 계산
// https://www.acmicpc.net/problem/1476
// 풀이 : hogumachu

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var E = 1, S = 1, M = 1
var result = 1
while E != input[0] || S != input[1] || M != input[2] {
    E += 1
    S += 1
    M += 1
    result += 1
    if E == 16 {
        E = 1
    }
    if S == 29 {
        S = 1
    }
    if M == 20 {
        M = 1
    }
}
print(result)
