# bluehire-frontend

## CI/CD Workflow

### 1. Trello Task
- Create a Trello card with an appropriate title and assign it to yourself.
- Each card should represent a small feature that can be completed within a week.
  - For example, building a homepage can be broken down into:
    - `Homepage Research & Design`
    - `Homepage View`
    - `Homepage ViewModel`
    - `Homepage Model`

### 2. Checkout & Pull Latest Code (git operations can be done in Xcode GUI alternatively)
- Switch to the `main` branch and pull the latest changes:
  ```bash
  git checkout main
  git pull origin main

### 3. Create Feature Branch
- Create a feature branch in Xcode using the format: #[card number]-[title]:
  ```bash
  git checkout -b #11-FixButton

### 4. Sync with Main Branch and Develop
- Periodically pull the latest changes from main:
  ```bash
  git pull origin main

## Code style
### 1. Use camelCase for naming 
- For example,
  ```bash
  var myCustomButton: UIButton
  func fetchUserData()

### 2. Reusable Components
- For example, if Navbar is used across multiple pages, extract it in a separate file and use any existing one
