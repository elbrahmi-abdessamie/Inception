
1. **Docker is an open platform for developing, shipping, and running applications:**
   - Docker provides a platform that facilitates the entire lifecycle of applications. It's "open" in the sense that it follows open standards, and it is widely used and supported by a large community of developers.

2. **Docker enables you to separate your applications from your infrastructure:**
   - This is a key concept in Docker. It uses containerization technology, allowing you to encapsulate your application and its dependencies into a container. Containers are lightweight, portable, and consistent across different environments. This separation of application and infrastructure makes it easier to manage and deploy applications across various platforms.

3. **So you can deliver software quickly:**
   - Because Docker containers encapsulate all the dependencies needed for an application to run, you can be more confident that your application will run consistently across different environments. This helps in reducing "it works on my machine" issues. It also enables developers to create, test, and deploy applications more rapidly since they don't need to worry as much about differences in the underlying infrastructure.

In summary, Docker simplifies the process of developing, shipping, and running applications by providing a standardized and portable environment. It promotes consistency and reproducibility, making it easier for developers and operations teams to work together seamlessly. The ability to separate applications from infrastructure contributes to the speed and efficiency of software delivery.

## Docker architecture
1- Docker Engine:
	* It's the core part of the whole Docker system. Docker Engine is an application which follow client-server architecture. It is installed on the host machine. There are three components in the Docker Engine.
		- * Server * : It's the docker daemon called dockerd. It can create and manage docker images, containers, networks...
		- * REST API * : It is used to instruct docker daemon what to do.
		- * Command Line Interface (CLI) * : It is a client which is used to enter docker commands.

https://geekflare.com/docker-architecture/