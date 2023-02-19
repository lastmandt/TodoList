# TodoList

## Overview
The TodoList application is a simple iOS app that allows users to view their tasks in two sections: completed and incompleted. 
The app doesn't have the ability to add or edit tasks.

## Architecture
The TodoList application follows the Model-View-Presenter (MVP) architecture pattern. 
The Presenter contains the Tasks (Model) and provides the prepared data to the View, which is implemented by the IView protocol. 
The View is responsible for rendering the prepared data, which is passed to it by the Presenter. 

## Features
- Supports RegularTask and ImportantTask from TaskManager
- Displays tasks in two sections: completed and incompleted
- Tasks are sorted by priority
- The task can be marked as completed
- Uses MVP architecture pattern for data handling and rendering


## Getting Started

### Requirements
- Xcode 13 or later
- Swift 5.5 or later
- iOS 14.0 or later

### Installation
- Clone the repository: git clone https://github.com/lastmandt/TodoList.git
- Open the TodoList.xcodeproj file in Xcode
- Run the app on a simulator or device

### Example
![Simulator Screen Recording - iPhone 14 - 2023-02-19 at 20 49 00](https://user-images.githubusercontent.com/26027427/219962331-8e0f862a-27dd-4ebe-8e57-18c8bb2a3e51.gif)
