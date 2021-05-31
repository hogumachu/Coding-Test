// 출처 : 프로그래머스 2020 카카오 인턴십 키패드 누르기
// https://programmers.co.kr/learn/courses/30/lessons/67256
// 풀이 : hogumachu

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var left = 10
    var right = 12
    var result = ""
    for number in numbers {
        if number == 1 || number == 4 || number == 7 {
            left = number
            result += "L"
        } else if number == 3 || number == 6 || number == 9 {
            right = number
            result += "R"
        } else {
            if getDistance(left, number) > getDistance(right, number) {
                right = number
                result += "R"
            } else if getDistance(left, number) < getDistance(right, number) {
                left = number
                result += "L"
            } else {
                if hand == "left" {
                    left = number
                    result += "L"
                } else {
                    right = number
                    result += "R"
                }
            }
        }
    }

    return result
}

func getDistance(_ now: Int, _ next: Int) -> Int {
    if now == 1 {
        if next == 2 {
            return 1
        } else if next == 5 {
            return 2
        } else if next == 8 {
            return 3
        } else if next == 0 {
            return 4
        }
    } else if now == 4 {
        if next == 2 {
            return 2
        } else if next == 5 {
            return 1
        } else if next == 8 {
            return 2
        } else if next == 0 {
            return 3
        }
    } else if now == 7 {
        if next == 2 {
            return 3
        } else if next == 5 {
            return 2
        } else if next == 8 {
            return 1
        } else if next == 0 {
            return 2
        }
    } else if now == 10 {
        if next == 2 {
            return 4
        } else if next == 5 {
            return 3
        } else if next == 8 {
            return 2
        } else if next == 0 {
            return 1
        }
    } else if now == 3 {
        if next == 2 {
            return 1
        } else if next == 5 {
            return 2
        } else if next == 8 {
            return 3
        } else if next == 0 {
            return 4
        }
    } else if now == 6 {
        if next == 2 {
            return 2
        } else if next == 5 {
            return 1
        } else if next == 8 {
            return 2
        } else if next == 0 {
            return 3
        }
    } else if now == 9 {
        if next == 2 {
            return 3
        } else if next == 5 {
            return 2
        } else if next == 8 {
            return 1
        } else if next == 0 {
            return 2
        }
    } else if now == 0 {
        if next == 2 {
            return 3
        } else if next == 5 {
            return 2
        } else if next == 8 {
            return 1
        } else if next == 0 {
            return 0
        }
    } else if now == 2 {
        if next == 2 {
            return 0
        } else if next == 5 {
            return 1
        } else if next == 8 {
            return 2
        } else if next == 0 {
            return 3
        }
    } else if now == 5 {
        if next == 2 {
            return 1
        } else if next == 5 {
            return 0
        } else if next == 8 {
            return 1
        } else if next == 0 {
            return 2
        }
    } else if now == 8 {
        if next == 2 {
            return 2
        } else if next == 5 {
            return 1
        } else if next == 8 {
            return 0
        } else if next == 0 {
            return 1
        }
    } else if now == 12 {
        if next == 2 {
            return 4
        } else if next == 5 {
            return 3
        } else if next == 8 {
            return 2
        } else if next == 0 {
            return 1
        }
    }
    return -1
}
