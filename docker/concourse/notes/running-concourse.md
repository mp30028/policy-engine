See documentation at [Concourse Documentation](https://concourse-ci.org/docs.html)

[Local Instance started up with docker compose defaults](https://localhost:9443/)

### Logging in with fly on localhost
fly -t example_01 login -c https://localhost:9943 --ca-cert ..\..\docker\concourse\certs\localhost.crt

### create and run hello world
1. `cd ..\.pipelines\hello-world`

2. Take a look at the prepared hello world pipeline `cat .\hello-world.yml`

3. Build the pipeline
`fly -t example_01 set-pipeline -p hello-world -c .\hello-world.yml`

4. Unpause the pipeline
`fly -t example_01 unpause-pipeline -p hello-world`

5. Run the pipeline
`fly -t example_01 trigger-job --job hello-world/hello-world-job --watch`