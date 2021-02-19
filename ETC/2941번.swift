// 출처 : 백준 크로아티아 알파벳
// https://www.acmicpc.net/problem/2941
// 풀이 : hogumachu


let input = readLine()!
var result: Int = 0
var str: String = ""

for i in input {
    str += "\(i)"
    switch i {
    case "c", "d", "l", "n", "s", "z":
        result += 1
        if str.count == 2 {
            if str != "dz" {
                str = "\(i)"
            }
        }
    case "j":
        if str == "nj" {
            str = ""
        } else if str == "lj" {
            str = ""
        } else {
            result += 1
            str = ""
        }
    case "=", "-":
        if str == "dz=" {
            result -= 1
        }
        str = ""
    default:
        result += 1
        str = ""
    }
}

print(result)
