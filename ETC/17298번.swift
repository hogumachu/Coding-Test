// 출처 : 백준 오큰수
// https://www.acmicpc.net/problem/17298
// 풀이 : hogumachu

// 시간초과 @@@@@

let _ = readLine()!
var input = readLine()!.split(separator: " ").map{ Int($0)! }
var result = ""
var count = 1
while input.count != 0 {
    if count == input.count {
        input.removeFirst()
        count = 0
        result += "-1 "
    } else if count > input.count {
        result += "-1 "
        break
    } else if input.first! < input[count] {
        result += "\(input[count]) "
        input.removeFirst()
        count = 0
    }
    count += 1
}

print(result)
