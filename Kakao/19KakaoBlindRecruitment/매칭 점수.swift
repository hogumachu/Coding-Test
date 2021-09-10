// 출처 : 프로그래머스 2019 KAKAO BLIND RECRUITMENT 매칭 점수
// https://programmers.co.kr/learn/courses/30/lessons/42893
// 풀이 : hogumachu
// HTML 문서 파싱하는 문제
// 조건에 따라서 파싱함

import Foundation

func solution(_ word:String, _ pages:[String]) -> Int {
    // 단어가 대소문자 상관을 안하므로 아예 소문자로 변경
    let word = word.lowercased()
    // 페이지의 index 값을 저장하기 위한 dictionary
    var pageDic: [String: Int] = [:]
    // 해당 페이지에 연결되어 있는 다른 페이지 (링크) 저장
    var pageInfo: [[String]] = Array(repeating: [], count: pages.count)
    // 페이지의 기본 점수 저장용
    var pageInt: [Int] = Array(repeating: 0, count: pages.count)
    // 결과값 (기본 점수 + 외부 링크 점수) 저장
    var result: [Double] = Array(repeating: 0.0, count: pages.count)

    // 먼저 페이지의 수 만큼 인덱스를 받음
    for pageIndex in 0..<pages.count {
        // 현재 인덱스의 페이지를 개행 단위로 쪼갬
        let enterPages = pages[pageIndex].split { $0 == "\n"}

        // 헤더와 바디의 index 를 저장하기 위한 값들
        var headStart = -1
        var headEnd = -1
        var bodyStart = -1
        var bodyEnd = -1

        // 현재 페이지에서 word 가 몇 번 나오나 카운팅하기 위한 값
        var counting = 0

        // 개행으로 쪼갠 페이지의 수 만큼 반복
        for i in 0..<enterPages.count {
            // 현재 페이지의 i 번째 줄을 소문자로 받음
            let line = enterPages[i].lowercased()

            // 만약 현재 줄의 길이가 word 의 크기와 같거나 크다면
            if line.count - word.count >= 0 {
                // 반복함
                for j in 0...line.count - word.count {
                    // 만약 line의 해당 값이 word 와 같다면
                    if line[j..<j + word.count] == word {
                        // 만약 현재 위치가 첫번째 (글의 제일 처음, 왼쪽에 Character 가 없다면) 라면
                        if j == 0 {
                            // 만약 오른쪽에 글자가 있다면
                            if j + word.count <= line.count - word.count {
                                // 오른쪽 글자가 알파벳이 아니면 counting 에 + 1
                                if !isAlpha(line[j + word.count]) {
                                    counting += 1
                                }
                            // 왼쪽, 오른쪽 글자 모두 없다면 counting + 1
                            } else {
                                counting += 1
                            }
                        // 만약 위치가 가장 처음이 아니라면 (왼쪽에 글자가 있다면)
                        } else {
                            // 만약 오른쪽에 글자가 있다면
                            if j + word.count <= line.count - word.count {
                                // 왼쪽, 오른쪽 글자가 모두 알파벳이 아니면 + 1
                                if !isAlpha(line[j + word.count]) && !isAlpha(line[j - 1]) {
                                    counting += 1
                                }
                            // 만약 오른쪽 글자가 없으면
                            } else {
                                // 왼쪽 글자가 알파벳이 아니면 counting + 1
                                if !isAlpha(line[j - 1]) {
                                    counting += 1
                                }
                            }
                        }

                    }
                }
            }

            // 헤드 시작의 인덱스를 얻음
            if enterPages[i].contains("<head>") {
                headStart = i
            }

            // 헤드 끝의 인덱스를 얻음
            if enterPages[i].contains("</head>") {
                headEnd = i
            }

            // 바디 시작의 인덱스를 얻음
            if enterPages[i].contains("<body>") {
                bodyStart = i
            }

            // 바디 끝의 인덱스를 얻음
            if enterPages[i].contains("</body>") {
                bodyEnd = i
            }
        }

        // 만약 헤드 시작과 끝의 인덱스 값이 있으면
        if headStart != -1 && headEnd != -1 {
            // 검색함
            for h in headStart+1..<headEnd {
                // 만약 meta 가 있고 https:// 이 포함되어 있다면
                if enterPages[h].contains("https://") && enterPages[h].contains("meta") {
                    // 일단 " 로 나눔
                    let splitEnterPages = enterPages[h].split { $0 == "\""}
                    // 그리고 반복함
                    for splitEnterPage in splitEnterPages {
                        // 여기에 https:// 이 있다 -> url 임
                        if splitEnterPage.contains("https://") {
                            // dic 에 index 로 저장함
                            pageDic[String(splitEnterPage)] = pageIndex
                            break
                        }
                    }
                }
            }
        }

        // body 도 head 와 마찬가지로 진행
        if bodyStart != -1 && bodyEnd != -1 {
            for b in bodyStart+1..<bodyEnd {
                // 조건대로 a href 에 url 이 있으면
                if enterPages[b].contains("a href") && enterPages[b].contains("https://") {
                    let splitEnterPages = enterPages[b].split { $0 == "\"" }
                    for splitEnterPage in splitEnterPages {
                        if splitEnterPage.contains("https://") {
                            // 현재 페이지의 info 에 추가함
                            pageInfo[pageIndex].append(String(splitEnterPage))
                        }
                    }
                }
            }
        }

        // 현재 페이지 기본 값에 counting 저장
        pageInt[pageIndex] = counting
    }

    // 반복함
    for i in 0..<pages.count {
        // 일단 result 에 저장해둔 기본 값을 저장함 (Double 로 -> 뒤에 나누기를 하기 때문)
        result[i] += Double(pageInt[i])

        // 페이지 정보를 가져옴
        for info in pageInfo[i] {
            // 만약 페이지 정보가 있으면
            if let next = pageDic[info] {
                // 주어진 조건대로 저장함
                result[next] += Double(pageInt[i]) / Double(pageInfo[i].count)
            }
        }
    }

    // enumerated 함
    let resultOffset = result.enumerated().max {
        if $0.element == $1.element {
            return $0.offset > $1.offset
        } else {
            return $0.element < $1.element
        }
    }!.offset

    return resultOffset
}

extension String {
    subscript (indices: ClosedRange<Int>) -> String {
        return String(self[self.index(self.startIndex, offsetBy: indices.lowerBound)...self.index(self.startIndex, offsetBy: indices.upperBound)])
    }

    subscript (indices: Range<Int>) -> String {
        return String(self[self.index(self.startIndex, offsetBy: indices.lowerBound)..<self.index(self.startIndex, offsetBy: indices.upperBound)])
    }

    subscript (index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}


func isAlpha(_ char: String) -> Bool {
    if Character(char).asciiValue! >= 97 && Character(char).asciiValue! <= 122 {
        return true
    } else {
        return false
    }
}
