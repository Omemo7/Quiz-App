# Quiz Master 🧠

An interactive and engaging mobile quiz application built with **Flutter**. This project goes beyond standard text questions by integrating multimedia elements and a tiered difficulty system to enhance user engagement.

## 📱 Project Overview

This application serves as a scalable boilerplate for educational or trivia-based mobile apps. It manages the complete user flow from selecting a difficulty level to answering questions and reviewing final scores.

## 🚀 Key Features

* **Adaptive Difficulty System:** A dedicated leveling mechanism allowing users to select their challenge tier (Beginner, Intermediate, Advanced) before starting.
* **Multimedia Integration:** Unique capability to display video content within the app, enabling video-based questions or learning segments.
* **Question Bank Management:** A centralized database module that efficiently handles question retrieval, answer validation, and randomization.
* **Score Tracking:** Real-time score calculation and a dedicated results dashboard to provide immediate user feedback.
* **Navigation Flow:** Seamless routing between the Start Screen, Quiz Interface, and Score Summary.

## 🏗 Architecture & Design

The application follows a **Screen-Based Architecture** to ensure clear navigation logic:

* **Data Layer:** Encapsulates the quiz logic and data sources, separating the "Question Bank" from the UI.
* **Presentation Layer:** Distinct UI screens for the Home, Game Loop, and Results, ensuring a clean separation of concerns.
* **State Management:** Efficient handling of user progress, score accumulation, and quiz reset functionality.

## 🛠 Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **Media:** Video Player Integration
* **Logic:** Custom Dart Data Structures
