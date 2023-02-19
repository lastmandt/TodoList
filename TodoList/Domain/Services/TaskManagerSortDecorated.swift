//
//  TaskManagerSortDecorated.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 15.02.2023.
//

import Foundation

/// Декорированный  TaskManager с сортировкой задач по приоритету
final class TaskManagerSortDecorated: ITaskManager {

	// MARK: - Private Properties

	private let wrappee: ITaskManager

	// MARK: - Lifecycle

	init(wrappee: ITaskManager) {
		self.wrappee = wrappee
	}

	// MARK: - Public

	/// Метод возвращает все задачи, отсортированные по приоритету
	func allTasks() -> [Task] {
		sortTasksByPriority(wrappee.allTasks())
	}

	/// Метод возвращает все завершенные задачи, отсортированные по приоритету
	func completedTasks() -> [Task] {
		sortTasksByPriority(wrappee.completedTasks())
	}

	/// Метод возвращает все незавершенные задачи, отсортированные по приоритету
	func incompletedTasks() -> [Task] {
		sortTasksByPriority(wrappee.incompletedTasks())
	}

	/// Добавление задачи
	func addTask(_ task: Task) {
		wrappee.addTask(task)
	}

	/// Удаление задачи
	func removeTask(_ task: Task) {
		wrappee.removeTask(task)
	}

	// MARK: - Private

	/// Метод сортировки задач по приоритету
	private func sortTasksByPriority(_ tasks: [Task]) -> [Task] {
		tasks.sorted {
			if let task0 = $0 as? ImportantTask, let task1 = $1 as? ImportantTask {
				return task0.priority.rawValue > task1.priority.rawValue
			}

			if $0 is ImportantTask, $1 is RegularTask {
				return true
			}

			if  $0 is RegularTask, $1 is ImportantTask {
				return false
			}

			return true
		}
	}
}
