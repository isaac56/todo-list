
import Foundation

class ButtonManager {
    private var titleText: Bool
    private var contentText: Bool
    private var isEditMode: Bool
    
    init() {
        self.titleText = false
        self.contentText = false
        self.isEditMode = false
    }
    
    func change(title: String) {
        self.titleText = (title != "") ? true : false
        NotificationCenter.default.post(name: ButtonManager.changeState, object: self,
                                        userInfo: [ButtonState.isEnable:isTextFull()])
    }
    
    func change(content: String) {
        self.contentText = (content != "") ? true : false
        NotificationCenter.default.post(name: ButtonManager.changeState, object: self,
                                        userInfo: [ButtonState.isEnable:isTextFull()])
    }
    
    func setEditMode() {
        self.isEditMode = true
    }
    
    func isTextFull() -> Bool {
        return isEditMode == true ? titleText || contentText : titleText && contentText
    }
}

extension ButtonManager {
    static let changeState = Notification.Name("changeState")
    
    enum ButtonState {
        case isEnable
    }
}
