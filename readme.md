# DevOps Campus Assignment

This repository contains the implementation of two DevOps assignments completed as part of the technical assessment.

The assignments demonstrate practical knowledge of Linux administration, Bash scripting, Git, Docker containerization, Flask application deployment, and CI automation using GitHub Actions.

## Assignments Overview

### Assignment 1: Linux Shell Scripting and Git

**Objective:** Demonstrate Linux command-line operations, Bash scripting, system monitoring, log analysis, and Git-based version control.

**Implementation:**

- Developed `sysinfo.sh` to collect system information, including hostname, date and time, logged-in user, disk usage, memory usage, and top five processes by memory consumption.
- Developed `log_report.sh` to analyze web server access logs.
- Implemented request counting, HTTP 404 error detection, and identification of the top three IP addresses.
- Added input validation and error handling.
- Generated and saved system information reports in the output directory.

**Technologies:** Ubuntu 24.04 (WSL2), Bash, Linux utilities, AWK, Git and GitHub.

**Detailed documentation:** [Assignment 1 README](assignment-1-linux-scripting/README.md)

**Source code:** [Assignment 1 Directory](assignment-1-linux-scripting/)

---

### Assignment 2: Dockerizing a Flask Application with CI

**Objective:** Containerize a Python Flask application using Docker and automate image building and application health verification using GitHub Actions.

**Implementation:**

- Containerized the Flask application using a custom Dockerfile.
- Configured the application with home (`/`) and health-check (`/health`) endpoints.
- Identified and fixed errors in the provided Dockerfile and Docker run command.
- Added a `.dockerignore` file to exclude unnecessary files from the Docker build context.
- Configured GitHub Actions to automatically build the Docker image on pushes and pull requests.
- Implemented an automated CI health check that starts the container, tests the `/health` endpoint, validates the response, and cleans up the container.

**Technologies:** Python, Flask, Docker, Dockerfile, Git, GitHub and GitHub Actions.

**Detailed documentation:** [Assignment 2 README](assignment-2-docker-ci/README.md)

**Source code:** [Assignment 2 Directory](assignment-2-docker-ci/)

---

## Repository Structure

```text
devops-campus-assignment/
│
├── .github/
│   └── workflows/
│       └── build.yml
│
├── assignment-1-linux-scripting/
│   ├── scripts/
│   ├── sample-logs/
│   ├── output/
│   └── README.md
│
├── assignment-2-docker-ci/
│   ├── app/
│   ├── Dockerfile
│   ├── .dockerignore
│   └── README.md
│
├── screenshots/
│   ├── assignment-1/
│   └── assignment-2/
│
├── .gitignore
└── readme.md
```

## Verification and Evidence

Screenshots demonstrating the implementation and successful execution of both assignments are available in the [`screenshots/`](screenshots/) directory.

The GitHub Actions workflow can be viewed under the repository's [Actions tab](../../actions).

## Conclusion

Both assignments demonstrate practical implementation of DevOps fundamentals, from Linux shell scripting and version control to Docker containerization and automated CI testing.

Each assignment includes its own README with implementation details, execution instructions, testing results, troubleshooting information, and screenshots where applicable.
