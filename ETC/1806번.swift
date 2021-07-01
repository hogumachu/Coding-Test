// 출처 : 백준 부분합
// https://www.acmicpc.net/problem/1806
// 풀이 : hogumachu

let ns = readLine()!.split(separator: " ").map{Int(String($0))!}
let values = readLine()!.split(separator: " ").map{Int(String($0))!}
var left = 0
var right = 2
var counting = 2
var now = values[0] + values[1]
var result = -1

while left < ns[0] && right <= ns[0] {
    if now >= ns[1] {
        if result == -1 {
            result = counting
        } else if result > counting {
            result = counting
        }
        now -= values[left]
        left += 1
        counting -= 1
    } else if now < ns[1] {
        if right == ns[0] {
            break
        }
        now += values[right]
        right += 1
        counting += 1
    }
}
print(result == -1 ? 0 : result)
