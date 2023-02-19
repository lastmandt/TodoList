//
//  Task.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 12.02.2023.
//

import Foundation

/// Родительский класс задачи
class Task {
	var title: String
	var completed: Bool = false

	init(title: String) {
		self.title = title
	}
}

/// Класс обычной задачи
final class RegularTask: Task {}

/// Класс важной задачи
final class ImportantTask: Task {
	enum Priority: Int {
		case low
		case medium
		case high
	}

	var priority: Priority
	var dueDate: Date? {
		switch priority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: Date())
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: Date())
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: Date())
		}
	}

	init(title: String, priority: Priority) {
		self.priority = priority
		super.init(title: title)
	}
}

extension ImportantTask.Priority: CustomStringConvertible {
	var description: String {
		switch self {
		case .high:
			return "High"
		case .medium:
			return "Medium"
		case .low:
			return "Low"
		}
	}
}

