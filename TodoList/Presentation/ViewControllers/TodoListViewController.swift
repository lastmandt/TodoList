//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 11.02.2023.
//

import UIKit

/// Протокол для получения данных 
protocol IView: AnyObject {
	func render(viewData: ViewData)
}

/// Класс для отображения задач
class TodoListViewController: UITableViewController, IView {

	// MARK: - Public Properties

	/// Свойство для хранения презентора, реализующего протокол ITodoListPresenter
	var presenter: ITodoListPresenter?

	// MARK: - Private Properties

	private var viewData: ViewData?

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		presenter?.viewControllerDidLoad()
	}

	// MARK: - Public

	/// Метод получения данных для отображения
	func render(viewData: ViewData) {
		self.viewData = viewData
		tableView.reloadData()
	}

	// MARK: - TableViewDataSource

	override func numberOfSections(in tableView: UITableView) -> Int {
		viewData?.sections.count ?? 0
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewData?.sections[section].tasks.count ?? 0
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		viewData?.sections[section].title
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let taskData = viewData?.sections[indexPath.section].tasks[indexPath.row]
		else {

			return UITableViewCell()
		}

		if taskData.priority != nil, taskData.dueDate != nil {
			let cell = tableView.dequeueReusableCell(withIdentifier: "ImportantTaskCell") as! ImportantTaskCell
			cell.configure(with: taskData)

			return cell
		}

		let cell = tableView.dequeueReusableCell(withIdentifier: "RegularTaskCell") as! RegularTaskCell
		cell.configure(with: taskData)

		return cell
	}

	// MARK: - TableViewDelegate

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter?.viewControllerDidSelectTask(at: indexPath)
	}
}
