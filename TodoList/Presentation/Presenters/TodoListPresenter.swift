//
//  TodoLIstPresenter.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 18.02.2023.
//

import UIKit

/// Протокол Презентор для работы с задачами
protocol ITodoListPresenter {
	init(viewController: IView, sectionForTaskManagerAdapter: ISectionForTaskManagerAdapter)
	func viewControllerDidLoad()
	func viewControllerDidSelectTask(at indexPath: IndexPath)
}

/// Класс Презентор для работы с задачами
class TodoListPresenter: ITodoListPresenter {

	// MARK: - Private Properties

	private unowned let viewController: IView
	private let sectionForTaskManagerAdapter: ISectionForTaskManagerAdapter

	// MARK: -  Lifecycle

	required init(
		viewController: IView,
		sectionForTaskManagerAdapter: ISectionForTaskManagerAdapter
	) {
		self.viewController = viewController
		self.sectionForTaskManagerAdapter = sectionForTaskManagerAdapter
	}

	// MARK: - Public

	/// Метод для подготовки и отправки данных для отображения
	func viewControllerDidLoad() {
		let viewData = makeViewData()
		viewController.render(viewData: viewData)
	}

	/// Метод для отметки выполнения задач
	func viewControllerDidSelectTask(at indexPath: IndexPath) {
		let task = sectionForTaskManagerAdapter.getTasksForSection(section: indexPath.section)[indexPath.row]
		task.completed = !task.completed
		let viewData = makeViewData()
		viewController.render(viewData: viewData)
	}

	// MARK: - Private

	private func makeViewData() -> ViewData {
		var sections = [SectionData]()
		for i in 0...sectionForTaskManagerAdapter.getSectionsTitles().count - 1 {
			let sectionData = SectionData(
				title: sectionForTaskManagerAdapter.getSectionsTitles()[i],
				tasks: sectionForTaskManagerAdapter.getTasksForSection(section: i).map({ task in
					mapTaskData(from: task)
				}))
			sections.append(sectionData)
		}
		let viewData = ViewData(sections: sections)

		return viewData
	}

	private func mapTaskData(from task: Task) -> TaskData {
		var taskData = TaskData(title: task.title, completed: task.completed)
		guard let task = task as? ImportantTask else { return taskData }
		taskData.priority = task.priority.description
		guard let dueDate = task.dueDate else { return taskData }
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/YY"
		taskData.dueDate = "\(dateFormatter.string(from: dueDate))"
		taskData.overdue = dueDate < Date()

		return taskData
	}
}
