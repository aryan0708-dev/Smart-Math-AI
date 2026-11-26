# Smart Math AI

A math tutor with a React frontend, a FastAPI/Python backend, and a Windows
desktop app. The backend uses SymPy for supported symbolic math and Ollama for
image transcription and general math reasoning.


## Requirements

- Windows 10/11
- Python 3.10 or later
- Node.js and npm
- Ollama installed and running
- The Ollama models used by this project:

```powershell
ollama pull minicpm-v:latest
ollama pull deepseek-r1:8b
```

Ollama models are downloaded separately and are not part of this repository.

## Run the desktop app from the source folder

From the project root, install the Python and frontend dependencies once:

```powershell
py -m venv venv
.\venv\Scripts\python.exe -m pip install -r .\backend\Requirements.txt
Push-Location .\frontend
npm.cmd ci
Pop-Location
```

Then double-click `Start Smart Math AI.bat`. It builds the frontend, opens the
desktop window, and starts the backend automatically. Ollama must already be
running with the models above available.

## Run as a web app for development

Open two PowerShell windows.

In the first window, from the project root:

```powershell
Push-Location .\backend
..\venv\Scripts\python.exe -m uvicorn main:app --reload
```

In the second window, from the project root:

```powershell
Push-Location .\frontend
npm.cmd ci
npm.cmd run dev
```

Open the local URL printed by Vite (usually `http://localhost:5173`).

## Build a Windows installer

Install the extra packaging dependency, then run the packaging script:

```powershell
.\venv\Scripts\python.exe -m pip install -r .\backend\DesktopBuildRequirements.txt
Push-Location .\frontend
npm.cmd run desktop:package
```

The installer is generated under `frontend\release`. It is a build artifact,
not source code; distribute it as a GitHub Release asset rather than committing
it to the repository.
