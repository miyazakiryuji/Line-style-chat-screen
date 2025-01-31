import SwiftUI

struct MessageRow: View {
    var body: some View {
        HStack(alignment: .top) {
            // チャットアイコン
            userThumb
            // チャットメッセージエリア
            messageText
            // チャットステータス
            messageState
            Spacer()
        }
        // チャット間の隙間を指定する
        .padding(.bottom)
    }
}

#Preview {
    MessageRow()
        .background(.cyan)
}

extension MessageRow {
    // チャットアイコン
    private var userThumb: some View {
        Image("user01")
            //  画像のサイズを変更できるようにするために記述する
            .resizable()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
    }
    // チャットメッセージエリア
    private var messageText: some View {
        Text("こんにちわ")
            .padding()
            .background(.white)
            .cornerRadius(30)
    }
    // チャットステータス
    private var messageState: some View {
        VStack(alignment: .trailing) {
            Spacer()
            Text("既読")
            Text(formattedDateString)
        }
        .foregroundColor(.secondary)
        .font(.footnote)
    }
    // 打刻された時刻
    private var formattedDateString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
}
