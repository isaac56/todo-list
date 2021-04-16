
import Foundation
import UIKit

class ToDoTableViewDelegate: NSObject, UITableViewDelegate {
    
    var cardManager = CardManager.shared
    var identifier: States
    var sendEditingCard : ((Card, Int) -> Void)!
    
    init(identifier: States) {
        self.identifier = identifier
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.systemGray6
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { uiMenuElements -> UIMenu? in
            return self.contextMenu(tableView, for: indexPath)
        }
    }
    
    func contextMenu(_ tableView: UITableView, for indexPath: IndexPath) -> UIMenu {
        return UIMenu(title: "", children: [moveToDoneMenu(tableView, for: indexPath), editMenu(tableView, for: indexPath),deleteMenu(tableView, for: indexPath)])
    }
    
    func moveToDoneMenu(_ tableView: UITableView, for indexPath: IndexPath) -> UIAction {
        return UIAction(title: ContextMenu.MoveToDone) { action in
            let card = self.cardManager.getCard(states: self.identifier, at: ReverseIndex.get(with: indexPath.section, total: self.cardManager.count(states: self.identifier)))
            let moveTonDoneCard = DraggedCard(cardInfo: card, index: indexPath.section)
    
            self.cardManager.moveCard(draggedCard: moveTonDoneCard, destinationIndexPath: IndexPath(row: 0, section: self.cardManager.count(states: .Done)), destinationIdentifier: .Done)
        }
    }
    
    func editMenu(_ tableView: UITableView, for indexPath: IndexPath) -> UIAction {
        return UIAction(title: ContextMenu.Edit) { action in
            let index = ReverseIndex.get(with: indexPath.section, total: self.cardManager.count(states: self.identifier))
            let card = self.cardManager.getCard(states: self.identifier, at: index)
            self.sendEditingCard(card, index)
        }
    }
    
    func editMenuPressed(closure: @escaping (Card, Int) -> Void) {
        self.sendEditingCard = closure
    }
    
    func deleteMenu(_ talbeView: UITableView, for indexPath: IndexPath) -> UIAction {
        return UIAction(title: ContextMenu.Delete, attributes: .destructive) { action in
            let index = ReverseIndex.get(with: indexPath.section, total: self.cardManager.count(states: self.identifier))
            
            self.cardManager.remove(states: self.identifier, at: index)
        }
    }
}
