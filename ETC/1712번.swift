// 출처 : 백준 손익분기점
// https://www.acmicpc.net/problem/1712
// 풀이 : hogumachu


let input = readLine()!.split(separator: " ").map{Int($0)!}

if input[1] >= input[2] {
    print(-1)
} else {
    print((input[0] / (input[2] - input[1])) + 1)
}
