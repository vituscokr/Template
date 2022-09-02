//
//  MyWidget.swift
//  MyWidget
//
//  Created by Gyeongtae Nam on 2022/05/09.
//

import WidgetKit
import SwiftUI



let snapshotEntry = WidgetContent(
    
    name: "iOS Concurrency with GCD and Operations",
    cardViewSubtitle: "iOS & Swift",
    descripitonPlainText: """
    Learn how to add concurrency to your apps! \
    Keep your app’s UI responsive to give your \
    users a great user experience.
    """,
    releaseAtDateTimeString: "Jun 23 2020 • Video Course (3 hrs, 21 mins)")

struct Provider: IntentTimelineProvider {


    
    //처음 렌더링시 레이아웃은 표시되지만 내용은 가려진 상태로 표시됩니다.
    //해당 메서드는 동기 호출이기 때문에 해당 메서드에서 네트워크 다운로드나 복잡한 계산 수행은 마세요.
    func placeholder(in context: Context) -> WidgetContent {
        snapshotEntry
    }

    //위젯의 스냅샷 ( 위젯갤러리에서 표시 , 데이터를 기다리는 상태에 표시) 
    public func getSnapshot(
      for configuration: TimelineIntervalIntent,
      in context: Context,
      completion: @escaping (WidgetContent) -> Void
    ) {

        let entry = snapshotEntry
        completion(entry)
    }

    public func getTimeline(
      for configuration: TimelineIntervalIntent,
      in context: Context,
      completion: @escaping (Timeline<WidgetContent>) -> Void
    ) {

        var entries = readContents()

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        guard let interval = configuration.interval as? Int else {
            return
        }
        for index in 0..<entries.count {
            entries[index].date = Calendar.current.date(byAdding: .second, value: index * interval, to: currentDate)!
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func readContents() -> [Entry] {
        var contents: [WidgetContent] = []
        let archiveURL = FileManager.sharedContainerURL().appendingPathComponent("contents.json")
        let decoder = JSONDecoder()
        if let codeData = try? Data(contentsOf: archiveURL) {
            do {
                contents = try decoder.decode([WidgetContent].self, from: codeData)
            } catch {
                print("Error: Can't decode contents")
            }
        }
        return  contents
    }
}





/*
struct WidgetContent: TimelineEntry {
    let date: Date
}
 */

struct MyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

@main
struct MyWidget: Widget {
    
    private let kind: String = "MyWidget"

    public var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: TimelineIntervalIntent.self, provider: Provider()) { entry in
            EntryView(model: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.white)
        }
//        StaticConfiguration(kind: kind,
//                            provider: Provider())
//        {
//            entry in
//            EntryView(model: snapshotEntry)
//        }
        .configurationDisplayName("이것은 위젯의 이름입니다.")
        .description("이것은 위젯의 설명입니다.")
        //.supportedFamilies([.systemMedium]) //중간 사이즈만 가능하게 할경우
    }
}

struct MyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MyWidgetEntryView(entry: snapshotEntry)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
