## APP_SECRET generator for symfony applications

### Setup

- in the `sd_symfony_secret_create.sh` file, change "vendor" to your vendor string. Use numbers and letters only

### Usage

- Just run the `sd_symfony_secret_create.sh` file in your terminal.
- It asks you for a project name. Use letters, numbers and max. 25 chars
- Copy the created secret

### Optional: use with alias

- create an alias in your terminal profile file:

  `alias symfony_secret='~/path/to/file/sd_symfony_secret_create.sh'`


- run `symfony_secret` in your terminal