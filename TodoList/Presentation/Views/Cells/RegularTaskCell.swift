//
//  RegularTaskCell.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 12.02.2023.
//

import UIKit

/// Класс для отображения обычной задачи
class RegularTaskCell: UITableViewCell {

	@IBOutlet var symbolLabel: UILabel!
	@IBOutlet var titleLabel: UILabel!

	/// Метод для конфигурирования RegularTask
	public func configure(with taskData: TaskData) {
		titleLabel.text = taskData.title
		if taskData.completed {
			symbolLabel.text = "\u{25C9}"
		} else {
			symbolLabel.text = "\u{25CB}"
		}
	}

}
