## Docker container for Magento DevDocs

This container contains everything necessary to run Jekyll3 for working with Magento DevDocs.

## Instructions

### Create the jekyll3 image

Reads the `Dockerfile` and creates an image tagged as jekyll3. 

~~~
docker build -t jekyll3 .
~~~

### Create the $path shell variable

This variable specifies where the DevDocs content is located.

~~~
path = <absolute path to devdocs directory>
~~~

### Create and run the container from the image

This will create the container named 'devdocs', mount the directory pointed at by the `$path` variable, and use jekyll to generate and serve the DevDocs HTML.

When the command exits, the container will be deleted.

~~~
docker run --rm --name devdocs -p 4000:4000 -v $path:/src jekyll3 jekyll serve --host 0.0.0.0
~~~

### Accessing the HTML site

For linux users, you can access the generated HTML site from `localhost` on port 4000.

For Mac and Windows users, you must get the ip of the virtual machine running docker.

Run the following command to get the ip of the docker machine and use it to access the generated HTML site on port 4000.

~~~
docker-machine ip default
~~~
