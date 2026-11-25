# Assignment 2: Dockerizing a Flask Application with CI

## 1. Objective

The objective of this assignment is to containerize a simple Python Flask application using Docker and configure a GitHub Actions workflow to automatically build the Docker image whenever code is pushed to the repository.

## 2. Technologies Used

- Python 3
- Flask
- Docker
- Dockerfile
- Git and GitHub
- GitHub Actions

## 3. Project Structure

```text
assignment-2-docker-ci/
├── app/
│   ├── app.py
│   └── requirements.txt
├── Dockerfile
├── .dockerignore
└── README.md
```

## 4. Flask Application

The application contains two endpoints:

### Home endpoint

```python
@app.route("/")
def home():
    return "Hello from DevOps!"
```

### Health-check endpoint

```python
@app.route("/health")
def health():
    return {"status": "ok"}
```

The application runs on port `5000` and binds to `0.0.0.0` so that it can receive requests from outside the container.

## 5. Docker Configuration

The Dockerfile performs the following operations:

1. Uses the lightweight Python 3.12 slim base image.
2. Sets `/app` as the working directory.
3. Copies `requirements.txt` into the container.
4. Installs Flask and its dependencies.
5. Copies the application source code.
6. Exposes port `5000`.
7. Starts the Flask application.

## 6. Build the Docker Image

Run the following command from the `assignment-2-docker-ci` directory:

```bash
docker build -t flask-devops-app:1.0 .
```

The image was successfully created with the tag:

```text
flask-devops-app:1.0
```

Verify the image:

```bash
docker images
```

## 7. Run the Docker Container

Start the container in detached mode:

```bash
docker run -d --name flask-devops-container -p 5000:5000 flask-devops-app:1.0
```

Here:
- `-d` runs the container in the background.
- `--name` assigns a name to the container.
- `-p 5000:5000` maps host port 5000 to container port 5000.

Verify that the container is running:

```bash
docker ps
```

## 8. Test the Application

### Test the home endpoint

Command:

```bash
curl http://localhost:5000/
```

Expected output:

```text
Hello from DevOps!
```

### Test the health endpoint

Command:

```bash
curl http://localhost:5000/health
```

Expected output:

```json
{"status":"ok"}
```

Both endpoints were tested successfully and returned HTTP status code `200`.

## 9. Container Logs

To inspect application logs:

```bash
docker logs flask-devops-container
```

The logs confirmed that Flask started successfully and handled requests to `/` and `/health`.

## 10. Stop and Remove the Container

Stop the running container:

```bash
docker stop flask-devops-container
```

Remove the container:

```bash
docker rm flask-devops-container
```

## 11. GitHub Actions CI

A GitHub Actions workflow will be configured in `.github/workflows/build.yml` to automatically build the Docker image whenever changes are pushed to the repository.

The workflow will verify that the Docker image can be built successfully.

## 12. Conclusion

Successfully containerized and executed a Python Flask application using Docker. Built the Docker image, ran the container, and verified both application endpoints through HTTP requests.

Configured GitHub Actions to automatically build the Docker image whenever code is pushed or a pull request is created.

The Docker deployment and automated CI pipeline were tested successfully.

## 13. Debugging and Troubleshooting

The teammate's Flask application code provided in the assignment was inspected.

The following configurations were verified:

| Component | Verification |
|---|---|
| Flask initialization | `Flask(__name__)` is correct |
| Route definitions | `/` and `/health` are correctly defined |
| Application startup | Main execution condition is correct |
| Network binding | `0.0.0.0` allows external container access |
| Application port | Flask listens on port `5000` |
| Dependencies | Flask is specified in `requirements.txt` |

No apparent source-code defects were found in the supplied snippet.

The following deployment-related issues were also considered:

**1. Incorrect network binding**

- Problem: Using `127.0.0.1` inside a Docker container can prevent external access.
- Fix: Bind the Flask application to `0.0.0.0`.

```python
app.run(host="0.0.0.0", port=5000)
```

**2. Missing Docker port mapping**

- Problem: Without publishing the container port, the application may not be accessible through the host machine.
- Fix: Start the container with the required port mapping.

```bash
docker run -d -p 5000:5000 flask-devops-app:1.0
```

**3. Container startup failure**

- Problem: If the container exits, the application becomes unavailable.
- Fix: Check container status and application logs.

```bash
docker ps -a
docker logs flask-devops-container
```

Finally, the Flask application was successfully tested, and both `/` and `/health` endpoints returned HTTP 200 responses.
