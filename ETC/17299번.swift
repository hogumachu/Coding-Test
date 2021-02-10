// 출처 : 백준 오등큰수
// https://www.acmicpc.net/problem/17299
// 풀이 : hogumachu

// 17298과 동일하게 시간초과 @@@@@

let _ = readLine()!
var input = readLine()!.split(separator: " ").map{ Int($0)! }
var value: [Int:Int] = [:]
var result = ""
var count = 0
for i in input {
    if value[i] == nil {
        value[i] = 1
    } else if value[i] != nil {
        value[i]! += 1
    }
}

print(value)
for i in 0..<input.count {
    for j in i..<input.count {
        if value[input[i]]! < value[input[j]]! {
            result += "\(input[j]) "
            break
        } else if value[input[i]]! >= value[input[j]]! && j == input.count - 1{
            result += "-1 "
        }
    }
}

print(result)
