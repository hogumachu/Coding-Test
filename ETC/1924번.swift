// 출처 : 백준 2007년
// https://www.acmicpc.net/problem/1924
// 풀이 : hogumachu

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var day: [String] = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
var now = input[1]
for i in 1..<input[0] {
    switch i {
    case 1,3,5,7,8,10,12:
        now += 31
    case 2:
        now += 28
    default:
        now += 30
    }
}

print(day[now % 7])
