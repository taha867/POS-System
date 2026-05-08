# POS System — AS Operations

ASP.NET Web Forms Point of Sale / Inventory system built with Visual Basic .NET targeting .NET Framework 4.8.

## Prerequisites

Before running the project make sure you have the following installed:

- **Visual Studio 2019 or 2022** (Community edition is fine)
  - Workload: **ASP.NET and web development**
- **.NET Framework 4.8 Developer Pack** — [Download](https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48)
- **IIS Express** (included with Visual Studio)

## Getting Started

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd "POS system"
```

### 2. Open the solution in Visual Studio

Open `POSSystem.slnx` by double-clicking it or via **File → Open → Project/Solution** in Visual Studio.

### 3. Restore NuGet packages

Right-click the solution in **Solution Explorer** → **Restore NuGet Packages**.

This restores all packages listed in `POSSystem/packages.config` (Bootstrap, jQuery, etc.).

### 4. Build the solution

Press `Ctrl + Shift + B` or go to **Build → Build Solution**.

Make sure there are no build errors in the Output window.

### 5. Run the application

Press **F5** (with debugging) or **Ctrl + F5** (without debugging).

IIS Express will start and the browser will open at:

```
https://localhost:44396/
```

> If port 44396 is taken, Visual Studio will assign a different port — check the browser URL after launch.

## Project Structure

```
POS system/
├── POSSystem/          # Main ASP.NET Web Forms project
│   ├── Pages/          # Feature pages (Operations module, etc.)
│   ├── App_Code/       # Shared VB.NET classes
│   ├── App_Start/      # Bundle and route config
│   ├── Content/        # CSS files (Bootstrap + custom)
│   ├── Scripts/        # JS files (jQuery, Bootstrap)
│   ├── Site.Master     # Shared page shell (navbar + footer)
│   ├── Default.aspx    # Home page
│   └── Web.config      # App configuration
├── POSSystem.slnx      # Visual Studio solution file
└── README.md
```

## Notes

- This project **cannot** be built with the `dotnet` CLI — Web Forms requires the full .NET Framework and Visual Studio.
- NuGet `packages/` folder is excluded from git. Always restore packages after cloning.
- The `.vs/` folder (Visual Studio local settings) is also excluded — Visual Studio recreates it automatically.
