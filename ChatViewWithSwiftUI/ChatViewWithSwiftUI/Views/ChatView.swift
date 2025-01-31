import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack(spacing: 0) {
            // MessageAreaを表示
            messageArea
                // 「,」なので注意が必要 位置を上に移動させている
                // .overlay：別のViewを重ね合わせている
                .overlay(navigationArea,alignment: .top)
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
                    HStack {
                        Circle()
                            .frame(width: 60, height: 60)
                        Capsule()
                            .frame(height: 60)
                    }
                    // チャット間の隙間を指定する
                    .padding(.bottom)
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
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Capsule()
                .frame(height: 40)
            Circle()
                .frame(width: 40, height: 40)
        }
        .padding()
        .background(.white)
    }
    
    private var navigationArea: some View {
        // Navigation Area
        HStack {
            Circle()
                .frame(width: 40, height: 40)
            Text("title")
            Spacer()
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
        }
            .foregroundStyle(.white)
            .padding()
            //  少し薄くしている
            .background(.black.opacity(0.5))
    }
}

#Preview {
    ChatView()
}
