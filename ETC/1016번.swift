// 출처 : 백준 제곱 ㄴㄴ수
// https://www.acmicpc.net/problem/1016
// 풀이 : hogumachu

let input = readLine()!.split(separator: " ").map{Int64(String($0))!}
var values: [Bool] = Array(repeating: true, count: Int(input[1] - input[0]) + 1)

if input[1] >= 2 {
    for i in 2...input[1] {
        if i * i > input[1] {
            break
        }
        if i * i >= input[0] {
            values[Int(i * i - input[0])] = false
        }
        let k = input[0] / (i * i)
        for j in k...input[1] {
            if i * i * j >= input[0] && i * i * j <= input[1] {
                values[Int(i * i * j - input[0])] = false
            } else if i * i * j > input[1] {
                break
            }
        }
    }
}

print(values.filter{$0 == true}.count)
