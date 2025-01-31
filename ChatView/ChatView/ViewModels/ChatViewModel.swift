import Foundation

class ChatViewModel {
    
    private func fetchChatData() -> [Chat] {
        let fileNmae: String = "chatData.json"
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileNmae, withExtension: nil)
            else {
                fatalError("\(fileNmae)が見つかりません")
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileNmae)のロードに失敗しました")
        }
        
        do {
            return try JSONDecoder().decode([Chat].self, from: data)
        } catch {
            fatalError("デコードエラー")
        }
        
    }
}
