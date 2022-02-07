# Node Compatibility Tester

## Description
I recently ran into a situation where I needed to automatically test mulitple nodejs projects for node TLS version compatibilities. So I wrote a script that uses `nvm` to fetch and install LTS node versions and then run the npm tests to test the project.


## Requirements
1. Your target project must have an `npm test` command that will actually test the project.
2. Have docker installed on your machine

## Usage
1. Build: `docker build -t node-compatibility .`
2. Run: `docker run --rm -v <project-directory>:/app node-compatibility`

## Results
The script will end by listing out the versions it found to be compatible.  
```##################################
# COMPATIBLE LTS VERSIONS
##################################
v16.13.2
v14.19.0```