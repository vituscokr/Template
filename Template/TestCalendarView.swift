//
//  TestCalendarView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/03.
//

import SwiftUI
import LSSLibrary
enum WeekDay: String {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    var longString: String {
        switch self {
        case .sunday:  return "일요일"
        case .monday: return "월요일"
        case .tuesday: return "화요일"
        case .wednesday: return "수요일"
        case .thursday: return "목요일"
        case .friday: return "금요일"
        case .saturday: return "토요일"
        }
    }
    var shortString: String {
        switch self {
        case .sunday:  return "일"
        case .monday: return "월"
        case .tuesday: return "화"
        case .wednesday: return "수"
        case .thursday: return "목"
        case .friday: return "금"
        case .saturday: return "토"
        }
    }

    static func getHeadTitle(from: Int) -> String? {
        switch from {
        case 1: return WeekDay.sunday.shortString
        case 2: return WeekDay.monday.shortString
        case 3: return WeekDay.tuesday.shortString
        case 4: return WeekDay.wednesday.shortString
        case 5: return WeekDay.thursday.shortString
        case 6: return WeekDay.friday.shortString
        case 7: return WeekDay.saturday.shortString
        default:
            return nil
        }
    }
//    init(from: Int) {
//        switch(from) {
//        case 1:
//            return .sunday
//        case 2:
//            return .monday
//        case 3:
//            return .tuesday
//        case 4:
//            return .we
//        case 5:
//        case 6:
//        case 7:
//
//        default:
//            return  .sunday
//
//        }
//    }
}

struct CalendarCell: Identifiable {
    var id: UUID =  UUID()
    var date: Date?
    var day: String {
        guard let date = date  else {
            return ""
        }
        return date.string(type: .day)
    }

}

struct TestCalendarView: View {

    @State var items = [CalendarCell]()
    var column: [GridItem] {
        let width: CGFloat = UIScreen.main.bounds.size.width / 7
        return Array(repeating: .init(.fixed(width), spacing: 0, alignment: .leading), count: 7)
    }
    @State var currentDate: Date = Date()
    var startOfMonth: Date {
        return currentDate.startOfMonth()
    }
    var year: String {
        currentDate.string(type: .year)
    }
    var month: String {
        currentDate.string(type: .month)
    }
    var body: some View {
        VStack {
            Button {
                currentDate = currentDate.preMonth()
            } label: {
                Text("이전달 ")
            }
            Button {
                currentDate = currentDate.nextMonth()
            } label: {
                Text("다음달 ")
            }
            Button {
                currentDate = currentDate.preYear()
            } label: {
                Text("이전년 ")
            }
            Button {
                currentDate = currentDate.nextYear()
            } label: {
                Text("다음년 ")
            }
            Text("\(year)년 \(month)월")
        LazyVGrid(columns: column, spacing: 0) {
            ForEach(1...7, id: \.self) { index in
                Text("\(WeekDay.getHeadTitle(from: index) ?? "" )")
            }
        }
            LazyVGrid(columns: column, spacing: 0) {
                ForEach(items) { item in
                    Text("\(item.day )")
                }
            }
        }.onAppear(perform: load)
                .onChange(of: currentDate) { _ in
                    load()
                }
    }
    func load() {
        items.removeAll()
        let start = currentDate.startOfMonth()
        let end = currentDate.endOfMonth()
        let year = currentDate.string(type: .year)
        let month = currentDate.string(type: .month)
        for _ in 1..<start.weekday {
            items.append(CalendarCell())
        }
        let newStart = Int(start.string(type: .day))!
        let newEnd = Int(end.string(type: .day))!
        for day in newStart...newEnd {
            let string = "\(year)-\(month)-\(day)"
            let date = string.date(type: .day)
            items.append(CalendarCell(date: date))
        }
    }
}
extension Date {
    var weekday: Int {
        let calendar = Calendar.current
        return calendar.component(.weekday, from: self)
    }
}
struct TestCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        TestCalendarView()
    }
}
