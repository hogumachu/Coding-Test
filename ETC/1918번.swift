// 출처 : 백준 후위 표기식
// https://www.acmicpc.net/problem/1918
// 풀이 : hogumachu

import Foundation

func solution() {
    let value = readLine()!.map{String($0)}
    var stack: [String] = []
    var result = ""
    for i in value {
        switch i {
        case "(":
            stack.append("(")
        case ")":
            while stack.last != "(" {
                result += stack.removeLast()
            }
            stack.removeLast()
        case "*":
            if stack.last == "*" || stack.last == "/" {
                while stack.last == "*" || stack.last == "/" {
                    result += stack.removeLast()
                }
            }
            stack.append("*")
        case "/":
            if stack.last == "*" || stack.last == "/" {
                while stack.last == "*" || stack.last == "/" {
                    result += stack.removeLast()
                }
            }
            stack.append("/")
        case "+":
            if stack.last == "*" || stack.last == "/" {
                while stack.last == "*" || stack.last == "/" {
                    result += stack.removeLast()
                }
                if stack.last == "+" || stack.last == "-" {
                    result += stack.removeLast()
                }
                stack.append("+")
            } else if stack.last == "+" || stack.last == "-" {
                result += stack.removeLast()
                stack.append("+")
            } else {
                stack.append("+")
            }
        case "-":
            if stack.last == "*" || stack.last == "/" {
                while stack.last == "*" || stack.last == "/" {
                    result += stack.removeLast()
                }
                if stack.last == "+" || stack.last == "-" {
                    result += stack.removeLast()
                }
                stack.append("-")
            } else if stack.last == "+" || stack.last == "-" {
                result += stack.removeLast()
                stack.append("-")
            } else {
                stack.append("-")
            }
        default:
            result += i
        }
    }
    while !stack.isEmpty {
        result += stack.removeLast()
    }
    print(result)
}

solution()
