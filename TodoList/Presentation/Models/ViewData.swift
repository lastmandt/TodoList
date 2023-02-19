//
//  ViewData.swift
//  TodoList
//
//  Created by Dmitry Troshkin on 19.02.2023.
//

import Foundation

/// Структура, описывающая подготовленные поля для отображения данных на экране.
struct ViewData {
	var sections: [SectionData]
}

/// Структура для описания секции задач
struct SectionData {
	var title: String
	var tasks: [TaskData]
}

/// Структура для описания задачи
struct TaskData {
	var title: String
	var completed: Bool
	var priority: String?
	var dueDate: String?
	var overdue: Bool? = false
}
