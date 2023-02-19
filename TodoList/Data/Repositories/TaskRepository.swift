//
//  TaskRepository.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 15.02.2023.
//

import Foundation

/// Протокол для хранения задач
protocol ITaskRepository {
	func createTasks(completionHandler: (([Task]) -> Void))
}

/// Класс для хранения задач
final class TaskRepository: ITaskRepository {

	/// Метод для создания массива задач
	/// - Parameter completionHandler: возвращает массив задач
	func createTasks(completionHandler: (([Task]) -> Void)) {
		let tasks: [Task] = [
			RegularTask(title: "RegularTask1"),
			RegularTask(title: "RegularTask2"),
			RegularTask(title: "RegularTask3"),
			ImportantTask(title: "ImportantTask1", priority: .low),
			ImportantTask(title: "ImportantTask2", priority: .medium),
			ImportantTask(title: "ImportantTask3", priority: .high),
			ImportantTask(title: "ImportantTask4", priority: .low),
			ImportantTask(title: "ImportantTask5", priority: .low),
			ImportantTask(title: "ImportantTask6", priority: .medium),
		]

		completionHandler(tasks)
	}
}
