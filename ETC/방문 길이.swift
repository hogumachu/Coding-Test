// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 방문 길이
// https://programmers.co.kr/learn/courses/30/lessons/49994
// 풀이 : hogumachu

func solution(_ dirs:String) -> Int {
    var now = (0, 0)
    var result = 0
    var visit: [(Int, Int, Int, Int)] = []
    for order in dirs {
        if order == "U" {
            if now.0 + 1 <= 5 {
                if visit.contains(where: {
                    if $0.0 == now.0 && $0.1 == now.1 && $0.2 == now.0 + 1 && $0.3 == now.1 {
                        return true
                    } else {
                        return false
                    }
                }) {
                } else {
                    result += 1
                    visit.append((now.0, now.1, now.0 + 1, now.1))
                    visit.append((now.0 + 1, now.1, now.0, now.1))
                }
                now = (now.0 + 1, now.1)
            }
        } else if order == "D" {
            if now.0 - 1 >= -5 {
                if visit.contains(where: {
                    if $0.0 == now.0 && $0.1 == now.1 && $0.2 == now.0 - 1 && $0.3 == now.1 {
                        return true
                    } else {
                        return false
                    }
                }) {
                } else {
                    result += 1
                    visit.append((now.0, now.1, now.0 - 1, now.1))
                    visit.append((now.0 - 1, now.1, now.0, now.1))
                }
                now = (now.0 - 1, now.1)
            }

        } else if order == "R" {
            if now.1 + 1 <= 5 {
                if visit.contains(where: {
                    if $0.0 == now.0 && $0.1 == now.1 && $0.2 == now.0 && $0.3 == now.1 + 1 {
                        return true
                    } else {
                        return false
                    }
                }) {
                } else {
                    result += 1
                    visit.append((now.0, now.1, now.0, now.1 + 1))
                    visit.append((now.0, now.1 + 1, now.0, now.1))
                }
                now = (now.0, now.1 + 1)
            }

        } else if order == "L" {
            if now.1 - 1 >= -5 {
                if visit.contains(where: {
                    if $0.0 == now.0 && $0.1 == now.1 && $0.2 == now.0 && $0.3 == now.1 - 1 {
                        return true
                    } else {
                        return false
                    }
                }) {
                } else {
                    result += 1
                    visit.append((now.0, now.1, now.0, now.1 - 1))
                    visit.append((now.0, now.1 - 1, now.0, now.1))
                }
                now = (now.0, now.1-1)
            }
        }
    }
    return result
}
