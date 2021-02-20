// 출처 : 백준 달팽이는 올라가고 싶다
// https://www.acmicpc.net/problem/2869
// 풀이 : hogumachu

let input = readLine()!.split(separator: " ").map{Double(String($0))!}
var result = (input[2] - input[1]) / (input[0] - input[1])

if result - Double(Int(result)) == 0.0 {
    print(Int(result))
} else {
    print(Int(result) + 1)
}
