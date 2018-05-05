# ng-in-httpd
An example project, on how to wrap an angular application in an apache2 httpd docker container.

You can find an article that describes the construction of the docker image here: https://blog.neoprime.it/ng-in-httpd/

The article goes in depth with routing, request rewriting, file permissions and tying the build and push docker tasks into the existing angular tooling.

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 1.7.4.

Below are the standard angular tool instructions

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `-prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

