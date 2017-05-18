## Docker container for Magento DevDocs

This container contains everything necessary to run Jekyll3 for working with Magento DevDocs.

## Instructions

### Create the jekyll3 image

Reads the `Dockerfile` and creates an image tagged as jekyll3. 

~~~
docker build -t jekyll3 .
~~~

### Run the container from the image

1. Navigate to your local devdocs repository folder. 
2. If you are running the container for the first time, delete the file `Gemfile.lock` if it exists.
3. Run the following command to create a docker container named 'devdocs' that generates and serves the DevDocs HTML:

~~~
docker run --rm --name devdocs -p 4000:4000 -v $PWD:/src jekyll3 jekyll serve --host 0.0.0.0 --incremental
~~~

When the command exits, the container will be deleted.

### Accessing the HTML site

For linux users, you can access the generated HTML site from `localhost` on port 4000.

For Mac and Windows users, you must get the ip of the virtual machine running docker.

Run the following command to get the ip of the docker machine and use it to access the generated HTML site on port 4000.

~~~
docker-machine ip default
~~~

## Shortening build times

You can shorten build times by ignoring entire version directories.

1. Navigate to your local devdocs repository folder.
2. Create a file called `._config.yml` with the following content:

~~~
#exclude: ['scss', 'bin', 'node_modules', 'vendor', '.git', '.idea', 'guides/v2.0', 'guides/v2.1']
#exclude: ['scss', 'bin', 'node_modules', 'vendor', '.git', '.idea', 'guides/v2.2', 'guides/v2.1']
#exclude: ['scss', 'bin', 'node_modules', 'vendor', '.git', '.idea', 'guides/v2.0', 'guides/v2.2']
#exclude: ['scss', 'bin', 'node_modules', 'vendor', '.git', '.idea']
#exclude: ['scss', 'bin', 'node_modules', 'vendor', '.git', '.idea', 'guides/v2.0', 'guides/v2.2','guides/v2.1']
~~~

3. Uncomment the line that excludes the versions you do not need built.
4. Run the following command in the devdocs repository folder:

~~~
docker run --rm --name devdocs -p 4000:4000 -v $PWD:/src jekyll3 jekyll serve --host 0.0.0.0 --config _config.yml,._config.yml --incremental
~~~
