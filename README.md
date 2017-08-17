# README


## Ruby version
`2.3.1`

## Rails version
`5.1.3`

## Pre-setup
Database username is `onedocwaysaml` with password `saml`. So make sure to create that via PSQL.
```sql
CREATE ROLE onedocwaysaml WITH createdb login PASSWORD 'saml';
```

## Setup
```bash
$ rake db:create
$ rake db:schema:load
$ rake db:seed
```

## Credentials
Administrator:
  - admin@fake.com
  - Please11

## Extra
To create a new Identity Provider go to `/identity_providers`
Logout via SLO still not implemented until we figure out the login correctly.
