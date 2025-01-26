+++
date = '2025-01-26T12:31:17+01:00'
title = 'Digital Ocean, its support and development database'
tags = ['development', 'database']
categories = ['programming']
+++

{{<admonition type="tip" >}}
Currently, only use Postgres 14 on the Digital Ocean application platform for development databases. 
{{</admonition>}}

While following the book {{< backlink "zero2prod" "Zero2Prod">}} you will learn how to deploy a {{< backlink "rust" "Rust">}} application to digital ocean through a Continuous Deployment pipeline. This is hardly anything new for me, I even teach a course in DevOps, but to not stray from the path of the book I followed its instructions.

The spec for digital ocean looks like this (this is abbreviated for your reading pleasure):

```yaml
name: zero2prod
region: fra
services:
    - name: zero2prod
      dockerfile_path: Dockerfile
      source_dir: .
      github:
        branch: main
        deploy_on_push: true
        repo: credmp/zero2prod
      health_check:
        http_path: /health_check
      http_port: 8000
      instance_count: 1
      instance_size_slug: basic-xxs
      routes:
      - path: /
databases:
  - name: newsletter
    engine: PG
    db_name: newsletter
    db_user: newsletter
    num_nodes: 1
    size: db-s-dev-database
    version: "16"
```

Actually, in the book it says to use *version* 12, but that version is no longer available. The latest version support is 16 and I chose that. There is only a small hiccup here, since [Postgres 15](https://www.postgresql.org/docs/release/15.0/) in 2022 there has been a breaking change in how databases are created. Notable, a [best practice](https://www.postgresql.org/docs/15/ddl-schemas.html#DDL-SCHEMAS-PATTERNS) following a CVE in 2018 ([CVE-2018-1058](https://nvd.nist.gov/vuln/detail/CVE-2018-1058)), has been made the standard. The standard being that by default users do not have creation rights, as an administrator you have to explicitly grant rights to your users.

Although this has been best practice since 2018, the change in Postgres 15 confronts users with this change. To my surprise Digital Ocean seems to not be aware of this change until now.

The development database created in the application platform using the spec from above creates an user (newsletter) with the following rights:

```
Role name | Attributes
------------------+------------------------------------------------------------
_doadmin_managed | Cannot login
_doadmin_monitor |
_dodb | Superuser, Replication
doadmin | Create role, Create DB, Replication, Bypass RLS
doadmin_group | Cannot login
newsletter |
postgres | Superuser, Create role, Create DB, Replication, Bypass RLS
```

You read that correctly, none. At the moment you can still create a postgres 14 database with digital ocean, which grants rights to the user and then you can upgrade it to the latest version, keeping the rights. But that is a workaround.

After determining the cause of the error I decided to mail digital ocean support with the issue. Timeline:

- December 30th: the answer is that I am using a development database, if I would only upgrade to a managed cluster I would have full access to the database. I politely responded explaining the problem again.
- December 30th: a quick response from the same agent, saying that based on the information provided I am trying to do things with the *doadmin* user, again not reading the actual question (or not understanding the problem). I again answer with a full log of the creation of the database and the rights given to the users.
- December 31st: another agent responds, telling me that using my spec it will create a database and that I can connect using the data from the control panel. This is exactly the information I already sent, but the agent does not actually look at the problem (no rights). I once again explain the issue.
- December 31st: another agent answers the ticket, asking how I create the database. I once again answer with the spec (which is already in the ticket 2 times now) and the steps I use (*doctl* from the command line).
- December 31st: another agent responds with some general information about creating databases, again not actually reading or understanding the issue.
- Januari 1st: a standard follow up email asking if I am happy with the service. I respond that the problem is not solved, and that I am fearful that given the interaction it will not be solved.
- Januari 2nd: another agent responds that they are talking internally
- Januari 2nd: a senior agent called Nate appears in the thread. Actually asking questions that explore the issue. I promptly respond.
- Januari 2nd: Nate acknowledges the issues and Digital Ocean starts working on a fix for their database provisioning. Provides the workaround of first using version 13 or 14 and then upgrading.
- Januari 9th: Still working
- Januari 15th: Still working
- Januari 21st: Another update that the provisioning process is quite complex and they are still working on a solution.

The proces to get something so trivial through the support channel is quite painful. I do realize I do not have paid support, and I am willing to wait it out because of that, but the first 5 interactions did nothing but destroy my confidence in the Digital Ocean support system. Luckily Nate picked up the ticket.

When a solution eventually comes around I will update this post.
