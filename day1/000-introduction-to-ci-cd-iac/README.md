Introduction to CI, CD, iac
===========================

Summary
-------

0. Devops?
1. About CI and the others concepts
2. More about Continuous Delivery
4. About IaC

Devops?
----

[Agile infrastructure and operations: how infra-gile are you?](https://pdfs.semanticscholar.org/0ff2/b98578b7fdfc2467698129a5fcb5e8a6e7e9.pdf)

About CI and the others concepts
-----

##### What is Continuous Integration ?

>  *In software engineering, continuous integration (CI) is the practice of merging all developer working copies to a shared mainline several times day...*

##### What is Continuous Deployment and Delivery ?
> *Every change that passes the automated tests is deployed to your environment automatically*

---

> ![Tooling infra](continuous_integration.png)

---

Pipelines
----

Expected profits from a **CI** pipeline

- Make self-testing deposit
- Maintain a source code versioned
- Automating releases
- Maintain short cycles
- Test different environments
- Make the latest release available

Expected profits from a **CD** pipeline

- Increase quality
- Detecting regressions
- Lower the costs
- Reducing risks on releases
- Offer a fast time to market
- Automated deployment

---

Build your pipeline...
-----

In the typical deployment pipeline model, each change executes a build to:

- Create packages that can be deployed in any environment
- Run unit tests (and possibly other tasks such as static analysis), giving feedback to developers in a matter of minutes

...with TESTS!
----

- The releases that pass this set of tests then have more complete automated acceptance tests performed against them
- Once we have releases that pass all automated tests, they are available for self-service deployment (registry docker) to other environments for activities such as exploratory testing, usability testing, and ultimately the deployment
- Complex products and services can include sophisticated deployment pipelines based on multiple repositories of source code

---

CI solutions are numerous
----

* **Gitlab CI**
* Travis CI
* Jenkins
* Bamboo
* TeamCity
* ....

---

> Let's try Gitlab!

Gitlab
----

> *GitLab is a web-based Git repository manager with wiki and issue tracking features, using an open source license, developed by GitLab Inc.*


Gitlab-Runner
----

> *GitLab Runner is the open source project that is used to run your jobs and send the results back to GitLab. It is used in conjunction with GitLab CI, the open-source continuous integration service included with GitLab that coordinates the jobs.*

Configuration of your pipelines for Gitlab CI
---

GitLab CI uses a YAML file `.gitlab-ci.yml` for the project configuration.

---

Differents modes (executors) for Gitlab CI
----

* Shell
* **Docker**
* SSH
* VirtualBox
* ...

Images
---

Allow you to specify a specific Docker image for the Gitlab Runner

Stages
----

Stages define the sequence of the pipeline.

* Stages are used by jobs
* The ordering of elements in stages defines the ordering of jobs execution
* Jobs of the same stage are run in parallel

Jobs
---

* Jobs are unlimitted
* Each jobs must have unique name
* Job is defined by a list of parameters that define the job behavior

Scripts
---

* Script is a parameter of job.
* It allows to execute commands inside the Runner.

Stage
---

* Stage is a parameter of job
* Stage allows you to group jobs

Tags
---

* Tags is used to select specific Runners.

* Runners tag are specified during Runner registration
* Tags allow you to run jobs with Runners that have the specified tags assigned to them (ruby, python, postgres)

Cache
---

Cache is used to specify a list of files and directories which should be cached between jobs. You can only use paths that are within the project workspace.

Artifacts
----

Artifacts is used to specify a list of files and directories which should be attached to the job after success. You can only use paths that are within the project workspace.

# Exemple

Dependencies & Pre-requisites
-----------------------------

- [make](https://en.wikipedia.org/wiki/Make_(software))

Usage
-----

**Makefiles** are a simple way to organize commands, to see this project useful
system commands run `make help`

Technical notes
---------------

The following summarises some important technical considerations:

Must-Read Sources
-----------------

Contributing
------------

If you find bugs or want to improve the documentation, please feel free to
contribute!

Happy coding!
