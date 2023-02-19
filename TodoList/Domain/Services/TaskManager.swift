//
//  TaskManager.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 12.02.2023.
//

import Foundation

/// Протокол для управления задачами
protocol ITaskManager {
	func allTasks() -> [Task]
	func completedTasks() -> [Task]
	func incompletedTasks() -> [Task]
	func addTask(_ task: Task)
	func removeTask(_ task: Task)
}

/// Класс для управления задачами
final class TaskManager: ITaskManager {

	// MARK: - Private Properties

	private var taskList: [Task] = []

	// MARK: - Public

	/// Метод возвращает все задачи
	func allTasks() -> [Task] {
		taskList
	}

	/// Метод возвращает все завершенные задачи
	func completedTasks() -> [Task] {
		taskList.filter { $0.completed }
	}

	/// Метод возвращает все незавершенные задачи
	func incompletedTasks() -> [Task] {
		taskList.filter { !$0.completed }
	}

	/// Добавление задачи
	func addTask(_ task: Task) {
		taskList.append(task)
	}

	/// Удаление задачи
	func removeTask(_ task: Task) {
		taskList.removeAll { $0 === task }
	}
}
