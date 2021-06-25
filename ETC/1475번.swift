// 출처 : 백준 방 번호
// https://www.acmicpc.net/problem/1475
// 풀이 : hogumachu

let n = readLine()!.map{Int(String($0))!}
var counting: [Int] = Array(repeating: 0, count: 9)
for number in n {
    if number == 6 || number == 9{
        counting[6] += 1
    } else {
        counting[number] += 1
    }
}
if counting[6] % 2 == 0 {
    counting[6] /= 2
} else {
    counting[6] /= 2
    counting[6] += 1
}
counting[6] > counting.max()! ? print(counting[6]) : print(counting.max()!)
