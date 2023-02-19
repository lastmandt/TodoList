//
//  SectionForTaskManagerAdapter.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 18.02.2023.
//

import Foundation

/// Протокол адаптер  по работе с секциями
protocol ISectionForTaskManagerAdapter {
	func getSectionsTitles() -> [String]
	func getTasksForSection(section sectionIndex: Int) -> [Task]
}

/// Класс адаптер для TaskManager по работе с секциями
final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {

	// MARK: - Private Properties
	
	private let taskManager: ITaskManager

	// MARK: - Lifecycle

	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}

	// MARK: - Public

	/// Метод для получения заголовков секций
	func getSectionsTitles() -> [String] {
		return ["Incompleted", "Completed"]
	}

	/// Метод для получения массива задач по индексу секции
	func getTasksForSection(section sectionIndex: Int) -> [Task] {
		switch sectionIndex {
		case 0:
			return taskManager.incompletedTasks()
		default:
			return taskManager.completedTasks()
		}
	}

}
