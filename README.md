# 🌍 Countries App

A clean, testable iOS app built with UIKit and MVVM that displays a list of countries fetched from a remote JSON endpoint. Users can scroll through countries and filter by name or capital in real time using a `UISearchController`.

---

## 🚀 Features

- ✅ Built entirely with **UIKit**, no Storyboards
- ✅ Clean **MVVM architecture** with **dependency injection**
- ✅ **Async/Await**-based network layer
- ✅ **Dynamic Type support** for accessibility
- ✅ Fully **testable ViewModel** using mocked services
- ✅ **Error handling** for network and decoding failures
- ✅ **Responsive UI** with right-aligned country codes
- ✅ Support for **iPhone/iPad + landscape rotation**

---

## 🧱 Architecture

Model → Country.swift
ViewModel → CountriesViewModel.swift
View → CountriesViewController.swift + CountryCell.swift
Networking → NetworkService.swift, APIEndpoint.swift, NetworkError.swift
Mocking → MockNetworkService.swift, BrokenMockService.swift
Tests → CountriesTests.swift

## 🔗 Data Source

JSON fetched from: https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json

## 🧪 Unit Testing

- Written using `XCTest`
- Tests for:
  - Successful fetch
  - Filtering by name or capital
  - Error handling (e.g., decoding failure)
  - Search behavior edge cases (case insensitivity, whitespace trimming)
- Async test cases using Swift Concurrency

---


## 🛠 Technologies Used

- Swift 5.9+
- UIKit
- MVVM
- URLSession with async/await
- XCTest

---

## 📂 Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/countries-app.git

   
