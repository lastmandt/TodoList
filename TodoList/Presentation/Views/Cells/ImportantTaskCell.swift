//
//  ImportantTaskCell.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 12.02.2023.
//

import UIKit

/// Класс для отображения важной задачи
class ImportantTaskCell: UITableViewCell {

	@IBOutlet var symbolLabel: UILabel!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var priorityLabel: UILabel!
	@IBOutlet var dueDateLabel: UILabel!

	/// Метод для конфигурирования ImportantTaskCell
	public func configure(with taskData: TaskData) {
		titleLabel.text = taskData.title
		if taskData.completed {
			symbolLabel.text = "\u{25C9}"
		} else {
			symbolLabel.text = "\u{25CB}"
		}
		priorityLabel.text = "Priority: \(taskData.priority ?? "")"
		dueDateLabel.text = "Due date: \(taskData.dueDate ?? "")"
		if taskData.overdue! {
			backgroundColor = .systemPink
		}
	}
}
