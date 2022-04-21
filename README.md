# rascal-lsp-skeletons


## Initializing a Maven project
Based on [https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)

To create a new directory named `my-app` with a new Maven project:
```
mvn archetype:generate \
    -DgroupId=com.mycompany.app \
    -DartifactId=my-app \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DarchetypeVersion=1.4 \
    -DinteractiveMode=false
```

From here on, start working inside the `my-app` directory:
```
cd my-app
```

## Including Rascal project information
First, create a directory to hold the Rascal project information:
```
mkdir META-INF && cd META-INF 
```

In this directory, create a file `RASCAL.MF` with the following contents:
```
Manifest-Version: 0.0.1
Main-Function: main
Project-Name: my-app
Main-Module: VSMain
Source: src
```

## Creating a Rascal file
Next up, create a Rascal file `Syntax.rsc` in the constructed `my-app/src/` directory.
```
module Syntax

extend lang::std::Layout;
extend lang::std::Id;

start syntax Machine = machine: State+ states;
syntax State = @Foldable state: "state" Id name Trans* out;
syntax Trans = trans: Id event ":" Id to;
```

## Working with Java bindings
In Rascal, you can bind functions to Java. To convert values between Rascal and Java, we use the library [Vallang](). This has to be added as a dependency to the maven project first in the file `pom.xml` in the file `pom.xml`. Vallang is available from the [usethesource maven repository](https://releases.usethesource.io/maven/). First, add this repository to the `pom.xml` file as follows:
```

```

Lets do this in a new file `CallJavaFunction.rsc`:
```
module CallJavaFunction


@javaClass{rascalJava.FuzzyWuzzyBinding}
public java int fuzz_token_sort_ratio(str lhs, str rhs);
```
