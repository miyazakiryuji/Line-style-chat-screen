import SwiftUI

struct ChatView: View {
    @State private var textFiled: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // MessageAreaを表示
            messageArea
                // 「,」なので注意が必要 位置を上に移動させている
                // .overlay：別のViewを重ね合わせている
                .overlay(navigationArea, alignment: .top)
            // InputAreaを表示
            inputArea
        }
    }
}
// 本体から分離
extension ChatView {
    // someは型を抽象化する
    private var messageArea: some View {
        // MessageArea
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0 ..< 15) { _ in
                    MessageRow()
                }
            }
            // Chat画面上部に隙間を入れる
            .padding(.horizontal)
            .padding(.top, 72)
        }
        .background(.cyan)
    }
    
    private var inputArea: some View {
        // inputArea
        HStack {
            HStack {
                Image(systemName: "plus")
                Image(systemName: "camera")
                Image(systemName: "photo")
            }
            .font(.title2)
            // $マーク忘れがち　Bindingの時は参照を渡すために必要
            TextField("Aa", text: $textFiled)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(Capsule())
                .overlay(
                    Image(systemName: "face.smiling")
                        .font(.title2)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                    , alignment: .trailing
                )
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding()
        .background(.white)
    }
    
    private var navigationArea: some View {
        // Navigation Area
        HStack {
            Image(systemName: "chevron.backward")
                .font(.title2)
            Text("title")
                .font(.title2.bold())
            Spacer()
            HStack(spacing: 16) {
                Image(systemName: "text.magnifyingglass")
                Image(systemName: "phone")
                Image(systemName: "line.3.horizontal")
            }
            .font(.title2)
        }
            .padding()
            //  少し薄くしている
            .background(.cyan.opacity(0.9))
    }
}

#Preview {
    ChatView()
}
