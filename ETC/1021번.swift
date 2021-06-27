// 출처 : 백준 회전하는 큐
// https://www.acmicpc.net/problem/1021
// 풀이 : hogumachu


let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var values: [Int] = Array(1...input[0])
var remove: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = 0
while !remove.isEmpty {
    queueRemove(remove[0])
}


func queueRemove(_ num: Int) -> Void {
    var left = 0
    for i in 1..<values.count {
        if values[i] == num {
            left = i
            break
        }
    }
    let right = values.count - left
    let back = Array(values[0..<left])
    let front = Array(values[left..<values.count])
    values = front + back
    result += left > right ? right : left
    remove.removeFirst()
    values.removeFirst()
}

print(result)
