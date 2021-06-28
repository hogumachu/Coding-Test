// 출처 : 백준 한 줄로 서기
// https://www.acmicpc.net/problem/1138
// 풀이 : hogumachu

let n = Int(readLine()!)!
let values = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: 100, count: n)

for i in 0..<values.count {
    var counting = 0
    var index = 0

    while counting < values.count && index < values.count{
        if counting == values[i] && arr[index] == 100{
            arr[index] = i + 1
            break
        }
        if counting < values[i] {
            if arr[index] > i + 1 {
                counting += 1
            }
        }
        index += 1
    }
}
var result = ""
if arr.count == 1 {
    print(1)
} else {
    for i in arr {
        result += "\(i) "
    }
    print(result)

}
